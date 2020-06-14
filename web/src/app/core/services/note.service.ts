import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { map } from 'rxjs/operators';
import { Observable } from 'rxjs';

import { Note } from '../models/note.model';
import { environment } from '../../../environments/environment';
import { SearchQuery } from '../models/search-query.model';


@Injectable({ providedIn: 'root'})
export class NoteService {

  private noteUrl = environment.noteApiUrl;

  constructor(private http: HttpClient) {}

    getAll(): Observable<Note[]> {
        return this.http.get<Note[]>(this.noteUrl, { headers: {'Accept':'*/*'}});
    }

    getSingle(id: string): Observable<Note> {
        return this.http.get<Note>(`${this.noteUrl}/${id}`, { headers: {'Accept':'*/*'}});
    }

    addNote(note: Note): Observable<Note> {
        return this.http.post<Note>(`${this.noteUrl}`, note, { headers: {'Accept':'*/*'}});
    }

    updateNote(note: Note): Observable<Note> {
        return this.http.put<Note>(`${this.noteUrl}/${note.id}`, note, { headers: {'Accept':'*/*'}});
    }

    deleteNote(id: string): Observable<Note> {
        return this.http.delete<Note>(`${this.noteUrl}/${id}`, { headers: {'Accept':'*/*'}});
    }
}
