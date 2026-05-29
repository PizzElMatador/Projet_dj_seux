import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, of } from 'rxjs';
import { Prestation, Reservation } from '../models/prestation.model';
import { environment } from '../../environments/environment';
import { catchError, tap } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class PrestationService {
  private apiUrl = environment.apiUrl;

  constructor(private http: HttpClient) { }

  getPrestations(): Observable<Prestation[]> {
    return this.http.get<Prestation[]>(`${this.apiUrl}/Prestation/Search`).pipe(
      tap(data => console.log('Prestations reçues:', data)),
      catchError(error => {
        console.error('Erreur lors de la récupération des prestations:', error);
        return of([]);
      })
    );
  }

  getPrestationById(id: number): Observable<Prestation | undefined> {
    return this.http.get<Prestation>(`${this.apiUrl}/Prestation/Single?id=${id}`).pipe(
      catchError(error => {
        console.error('Erreur lors de la récupération de la prestation:', error);
        return of(undefined);
      })
    );
  }

  createPrestation(prestation: Prestation): Observable<Prestation> {
    return this.http.post<Prestation>(`${this.apiUrl}/Prestation/Add`, prestation);
  }

  getReservationsByClient(clientId: number): Observable<Reservation[]> {
  return this.http.get<Reservation[]>(
    `${this.apiUrl}/Reservation/Client?id=${clientId}`
  ).pipe(
    catchError(error => {
      console.error('Erreur lors de la récupération des réservations:', error);
      return of([]);
    })
  );
}

createReservation(reservation: any): Observable<any> {
  return this.http.post<any>(
    `${this.apiUrl}/Reservation/Add`,
    reservation
  );
}
}