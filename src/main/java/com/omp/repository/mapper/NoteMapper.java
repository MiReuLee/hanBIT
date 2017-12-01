package com.omp.repository.mapper;

import java.util.List;

import com.omp.repository.domain.Note;

public interface NoteMapper {
	public List<Note> NoteList() throws Exception;
	public void insertNote(Note study) throws Exception;
	public void deleteNote(int no) throws Exception;
	public Note reNoteForm(int no) throws Exception;
	public Note detail(int no) throws Exception;
}
