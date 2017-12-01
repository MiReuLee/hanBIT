<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<footer class="navbar-fixed-bottom">
	<div id="jsi-illumination-container" class="container" style="padding-top: 10px">
		<h5 style="color: black; text-shadow: 0 0 0.5px white; float: right;">
			© 2017 BitCamp「  <i class="fa fa-map-marker" aria-hidden="true"></i> 미니 프로젝트 - 2  」All rights reserved 
			<small
				class="text-muted float-right"> <a
				href="mailto:aileen528@naver.com">aileen528@naver.com</a>
				&nbsp;
			</small>
		</h5>
	</div>
	<script>
	var RENDERER = {
			SNOW_COUNT : 400,
			HUMAN_COUNT : 10,
			DEPTH : 5,
			VELOCITY : 0.5,
			RADIUS : 5,
			DELTA_THETA : Math.PI / 2000,
			GROUND_RATE : 0.6,
			
			init : function(){
				this.setParameters();
				this.reconstructMethod();
				this.createElements();
				this.render();
			},
			setParameters : function(){
				this.$container = $('#jsi-illumination-container');
				this.width = this.$container.width();
				this.height = this.$container.height();
				this.context = $('<canvas />').attr({width : this.width, height : this.height}).appendTo(this.$container).get(0).getContext('2d');
				this.elements = [];
				this.count = 0;
				this.theta = 0;
			},
			getRandomValue : function(range){
				return range.min + (range.max - range.min) * Math.random();
			},
			reconstructMethod : function(){
				this.render = this.render.bind(this);
			},
			createElements : function(){
				this.tree = TREE.init(this, this.elements);
				this.count = this.elements.length;
				
				for(var i = 0, length = this.SNOW_COUNT; i < length; i++){
					this.elements.push(new PARTICLE_SNOW(this));
				}
				for(var i = 0, length = this.HUMAN_COUNT; i < length; i++){
					this.elements.push(new HUMAN(this));
				}
			},
			render : function(){
				requestAnimationFrame(this.render);
				
				var context = this.context,
					count = 0,
					gradient = context.createLinearGradient(0, 0, 0, this.height),
					base = (25 + 15 * Math.cos(this.theta));
					
				gradient.addColorStop(0, 'hsl(210, 50%, ' + (base + 30) + '%)');
				gradient.addColorStop(1, 'hsl(210, 50%, ' + base + '%)');
				context.fillStyle = gradient;
				context.fillRect(0, 0, this.width, this.height);
				
				this.elements.sort(function(particle1, particle2){
					return particle1.verticalThreshold - particle2.verticalThreshold;
				});
				for(var i = 0, length = this.elements.length; i < length; i++){
					if(this.elements[i].render(context, false, base)){
						count++;
					}
				}
				context.save();
				context.globalAlpha = count / this.count;
				context.drawImage(this.tree, 0, 0);
				context.restore();
				
				for(var i = 0, length = this.elements.length; i < length; i++){
					this.elements[i].render(context, true, base);
				}
				this.theta += this.DELTA_THETA;
				this.theta %= Math.PI * 2;
			}
		};
		var TREE = {
			TRUNK_BASE : 10,
			TRUNK_RATE : 0.8,
			BRANCH_RADIAN : Math.PI / 6,
			BRANCH_RATE : 0.6,
			BRANCH_LEVEL : 7,
			THRESHOLD : 1.2,
			DELTA_HUE : 0.4,
			COLOR : 'hsl(120, 50%, 10%)',
			
			init : function(renderer, elements){
				var canvas = $('<canvas />').attr({width : renderer.width, height : renderer.height}).get(0),
					context = canvas.getContext('2d');
					
				this.renderer = renderer;
				this.hue = 0;
				this.render(context, elements);
				return canvas;
			},
			render : function(context, elements){
				this.drawTree(context, this.renderer.width / 2, this.renderer.height * 9 / 10, Math.PI / 2, this.renderer.height / 4, this.TRUNK_BASE, 0, elements);
			},
			drawTree : function(context, x, y, radian, length, width, level, elements){
				if (level > this.BRANCH_LEVEL) {
					return;
				}
				var sin = length * Math.sin(radian),
					cos = length * Math.cos(radian);
					
				this.drawTree(context, x + cos * this.TRUNK_RATE, y - sin * this.TRUNK_RATE, radian, length * this.TRUNK_RATE, width * this.TRUNK_RATE, level + 1, elements);
				
				for(var i = -1; i <= 1; i += 2){
					this.drawTree(context, x + cos * this.BRANCH_RATE, y - sin * this.BRANCH_RATE, radian + this.BRANCH_RADIAN * i, length * this.BRANCH_RATE, width * this.BRANCH_RATE, level + 1, elements);
				}
				context.strokeStyle = this.COLOR;
				context.lineWidth = width;
				context.beginPath();
				context.moveTo(x, y);
				context.lineTo(x + length*Math.cos(radian), y - length*Math.sin(radian));
				context.stroke();
				
				if(width > this.THRESHOLD && width < this.TRUNK_BASE){
					elements.push(new PARTICLE_LIGHT(this.renderer, x + length * Math.cos(radian), y - length * Math.sin(radian), this.hue));
					
					this.hue += this.DELTA_HUE;
					
					if(this.hue == 360){
						this.hue = 0;
					}
				}
			}
		};
		var PARTICLE_LIGHT = function(renderer, x, y, hue){
			this.renderer = renderer;
			this.baseX = x;
			this.baseY = y;
			this.hue = hue;
			this.init();
		};
		PARTICLE_LIGHT.prototype = {
			REACH_INTERVAL_RANGE : {min : 200, max : 10000},
			DELTA_HUE : 0.5,
			DELTA_SATURATION : 0.5,
			DELTA_LUMINANCE : -0.5,
			
			init : function(){
				this.x = this.baseX;
				this.y = this.baseY;
				this.z = this.renderer.DEPTH / 2;
				this.rate = this.z / this.renderer.DEPTH;
				this.radius = this.renderer.RADIUS * this.rate;
				this.vx = this.renderer.getRandomValue({min : -this.renderer.VELOCITY, max : this.renderer.VELOCITY}) * this.rate;
				this.vy = this.renderer.VELOCITY * this.rate;
				this.count = this.renderer.getRandomValue(this.REACH_INTERVAL_RANGE) | 0;
				this.saturation = 0;
				this.verticalThreshold = this.renderer.height * (this.renderer.GROUND_RATE + (1 - this.renderer.GROUND_RATE) * this.rate);
				this.theta = 0;
				this.deltaTheta = -this.vx / 30;
				this.luminance = 80;
				this.scale = 1;
			},
			render : function(context){
				context.save();
				context.translate(this.x, this.y);
				context.rotate(this.theta);
				context.scale(this.scale, this.scale);
				context.strokeStyle = 'hsl(' + this.hue + ', ' + this.saturation + '%, ' + (this.luminance + 20 * this.rate) + '%)';
				context.lineWidth = 3 * this.rate / this.scale;
				
				for(var i = 0; i < 3; i++){
					context.save();
					context.rotate(Math.PI * i * 2 / 3);
					context.beginPath();
					context.moveTo(0, -this.radius);
					context.lineTo(0, this.radius);
					context.stroke();
					context.restore();
				}
				context.restore();
				
				this.hue += this.DELTA_HUE;
				
				if(this.hue == 360){
					this.hue = 0;
				}
				if(this.count > 0){
					this.count--;
					this.x = this.baseX - this.vx * this.count;
					this.y = this.baseY - this.vy * this.count;
				}else{
					if(this.saturation < 80){
						this.saturation += this.DELTA_SATURATION;
					}
					if(this.luminance > 60){
						this.luminance += this.DELTA_LUMINANCE;
					}
					if(this.scale < 2){
						this.scale += 0.01;
					}
				}
				this.theta += this.deltaTheta;
				this.theta %= Math.PI * 2;
				return this.count == 0;
			}
		};
		var PARTICLE_SNOW = function(renderer){
			this.renderer = renderer;
			this.init(false);
		};
		PARTICLE_SNOW.prototype = {
			init : function(toReset){
				this.z = this.renderer.getRandomValue({min : 1, max : this.renderer.DEPTH});
				this.x = this.renderer.getRandomValue({min : 0, max : this.renderer.width});
				this.y = toReset ? -this.renderer.getRandomValue({min : this.radius, max : this.renderer.height / 3}) : this.renderer.getRandomValue({min : 0, max : this.renderer.height});
				this.rate = this.z / this.renderer.DEPTH;
				this.radius = this.renderer.RADIUS * this.rate;
				this.vx = this.renderer.getRandomValue({min : -this.renderer.VELOCITY, max : this.renderer.VELOCITY}) * this.rate;
				this.vy = this.renderer.VELOCITY * this.rate;
				this.opacity = 1;
				this.verticalThreshold = this.renderer.height * (this.renderer.GROUND_RATE + (1 - this.renderer.GROUND_RATE) * this.rate);
				this.theta = 0;
				this.deltaTheta = -this.vx / 30;
			},
			render : function(context, toFront){
				if(toFront && this.z <= this.renderer.DEPTH / 2 || !toFront && this.z > this.renderer.DEPTH / 2){
					return;
				}
				context.save();
				context.translate(this.x, this.y);
				context.rotate(this.theta);
				context.globalAlpha = this.opacity;
				context.strokeStyle = 'hsl(0, 0%, ' + (80 + 20 * this.rate) + '%)';
				context.lineWidth = 2 * this.rate;
				
				for(var i = 0; i < 3; i++){
					context.save();
					context.rotate(Math.PI * i * 2 / 3);
					context.beginPath();
					context.moveTo(0, -this.radius);
					context.lineTo(0, this.radius);
					context.stroke();
					context.restore();
				}
				context.restore();
				
				if(this.x < -this.radius || this.x > this.renderer.width + this.radius){
					this.init(true);
				}else if(this.y > this.verticalThreshold){
					this.opacity -= 0.05;
					
					if(this.opacity <= 0){
						this.init(true);
					}
					return false;
				}
				this.x += this.vx;
				this.y += this.vy;
				this.theta += this.deltaTheta;
				this.theta %= Math.PI * 2;
				return false;
			}
		};
		var HUMAN = function(renderer){
			this.renderer = renderer;
			this.init(true);
		};
		HUMAN.prototype = {
			HORIZONTAL_OFFSET : 30,
			VERTICAL_OFFSET_RATE_RANGE : {min : 0, max : 0.08},
			VELOCITY_OFFSET : {min : 0.3, max : 0.6},
			WATCHING_COUNT : {min : 100, max : 500},
			WATCHING_RATE : 0.01,
			
			init : function(toInit){
				this.direction = (Math.random() < 0.5) ? 1 : -1;
				
				if(toInit){
					this.x = this.renderer.getRandomValue({min : 0, max : this.renderer.width});
				}else{
					this.x = (this.direction > 0) ? -this.HORIZONTAL_OFFSET : (this.renderer.width + this.HORIZONTAL_OFFSET);
				}
				var position = this.renderer.getRandomValue(this.VERTICAL_OFFSET_RATE_RANGE) * this.renderer.height,
					verticalPosition = this.renderer.height * this.VERTICAL_OFFSET_RATE_RANGE.max;
					
				this.rate = position / verticalPosition;
				this.y = this.renderer.height - position;
				this.vx = this.renderer.getRandomValue(this.VELOCITY_OFFSET) * this.direction;
				this.vxRate = 1.5 * (0.5 + 0.5 * (verticalPosition - position) / verticalPosition);
				this.theta = 0;
				this.verticalThreshold = this.y;
				this.watching = false;
				this.watchingFlag = false;
				this.watchingDone = false;
				this.offset = 0;
				this.count = this.renderer.getRandomValue(this.WATCHING_COUNT) | 0;
			},
			render : function(context, toFront, base){
				if(!toFront){
					return;
				}
				if(this.watching){
					if(--this.count == 0){
						this.watching = false;
						this.watchingFlag = false;
						this.watchingDone = true;
					}else{
						if(this.offset > -10){
							this.offset -= 0.5;
						}
					}
				}else{
					if(this.offset < 0){
						this.offset += 0.5;
					}
					if(!this.watchingFlag && !this.watchingDone && this.x > this.renderer.width * 2 / 5 && this.x < this.renderer.width * 3 / 5 && Math.random() < this.WATCHING_RATE){
						this.watchingFlag = true;
					}
				}
				var color = 'hsl(210, 50%, ' + ((base - 20) + 20 * this.rate)  + '%)';
				
				context.save();
				context.translate(this.x, this.y);
				context.scale(this.direction * this.vxRate, this.vxRate);
				context.fillStyle = color;
				context.strokeStyle = color;
				context.lineWidth = 2;
				
				context.beginPath();
				context.moveTo(this.offset - 30, -60);
				context.quadraticCurveTo(this.offset - 20, -75, this.offset, -75);
				context.quadraticCurveTo(this.offset + 20, -75, this.offset + 30, -60);
				context.closePath();
				context.fill();
				
				context.beginPath();
				context.moveTo(this.offset, -80);
				context.lineTo(this.offset, -35);
				context.stroke();
				
				context.beginPath();
				context.arc(-10, -55, 5, 0, Math.PI * 2, false);
				context.fill();
				
				context.beginPath();
				context.moveTo(-15, -50);
				context.quadraticCurveTo(-20, -40, -15, -30);
				context.lineTo(-5, -30);
				context.quadraticCurveTo(0, -40, -5, -50);
				context.closePath();
				context.fill();
				
				for(var i = -1; i <= 1; i += 2){
					context.beginPath();
					context.moveTo(-13 + this.offset / 4 * i, -30);
					context.lineTo(-13 + this.offset / 4 * i + 7 * Math.sin(this.theta) * i, -5);
					context.lineTo(-3 + this.offset / 4 * i + this.offset * 2 / 5 + 7 * Math.sin(this.theta) * i, -5);
					context.lineTo(-7 + this.offset / 4 * i + 7 * Math.sin(this.theta) * i, -10);
					context.lineTo(-7 + this.offset / 4 * i, -30);
					context.closePath();
					context.fill();
				}
				context.restore();
				
				if(!this.watching){
					this.theta += this.vx / 5;
					
					if(this.theta >= Math.PI * 2 || this.theta <= -Math.PI * 2){
						if(this.watchingFlag){
							this.theta = 0;
							this.watching = true;
							this.watchingFlag = false;
						}else{
							this.theta %= Math.PI * 2;
						}
					}
					this.x += this.vx * this.vxRate;
				}
				if(this.x < -this.HORIZONTAL_OFFSET && this.direction < 0 || this.x > this.renderer.width + this.HORIZONTAL_OFFSET && this.direction > 0){
					this.init(false);
				}
				return false;
			}
		};
		$(function(){
			RENDERER.init();
		});
	</script>
</footer>