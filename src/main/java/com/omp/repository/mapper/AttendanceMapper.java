package com.omp.repository.mapper;

import java.util.List;

import com.omp.repository.domain.Attendance;

public interface AttendanceMapper 
{
	public void insertAttendance(Attendance attendance) throws Exception;
	public void modifyAttendance(Attendance attendance) throws Exception;
	public List<Attendance> readAttendance(Attendance attendance) throws Exception;
	public int totalAttendance() throws Exception;
}
