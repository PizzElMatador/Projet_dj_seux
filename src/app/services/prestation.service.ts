import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, of } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { Prestation, Reservation } from '../models/prestation.model';

@Injectable({
  providedIn: 'root'
})
export class PrestationService {
  private apiUrl = 'https://localhost:7051/Prestation';

  constructor(private http: HttpClient) { }

  getPrestations(): Observable<Prestation[]> {
    return this.http.get<Prestation[]>(`${this.apiUrl}/Search`).pipe(
      catchError(error => {
        console.error('Erreur lors de la récupération des prestations:', error);
        return of([]);
      })
    );
  }

  getPrestationById(id: number): Observable<Prestation | undefined> {
    return this.http.get<Prestation>(`${this.apiUrl}/Single?id=${id}`).pipe(
      catchError(error => {
        console.error('Erreur lors de la récupération de la prestation:', error);
        return of(undefined);
      })
    );
  }

  createPrestation(prestation: Prestation): Observable<Prestation> {
    return this.http.post<Prestation>(`${this.apiUrl}/Add`, prestation);
  }

  // Réservations - à implémenter quand ReservationController sera ajouté
  getReservationsByClient(clientId: number): Observable<Reservation[]> {
    // TODO: Connecter à l'API quand ReservationController sera disponible
    return of([]);
  }
}
