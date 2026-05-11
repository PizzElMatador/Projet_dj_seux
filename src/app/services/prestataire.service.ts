import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, of } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { Prestation, Prestataire } from '../models/prestation.model';
import { environment } from '../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class PrestataireService {
  private apiUrl = environment.apiUrl;
  
  constructor(private http: HttpClient) { }

  getAnnoncesByPrestataire(prestatairId: number): Observable<Prestation[]> {
    // TODO: Ajouter un endpoint pour filtrer par prestataire
    return this.http.get<Prestation[]>(`${this.apiUrl}/Search`).pipe(
      catchError(error => {
        console.error('Erreur:', error);
        return of([]);
      })
    );
  }

  getAllAnnonces(): Observable<Prestation[]> {
    return this.http.get<Prestation[]>(`${this.apiUrl}/Search`).pipe(
      catchError(error => {
        console.error('Erreur:', error);
        return of([]);
      })
    );
  }

  createAnnonce(prestataire: Prestataire, data: {
    nom_prestation: string;
    description_presta: string;
    prix: number;
    nom_type: string;
    id_type: number;
  }): Observable<Prestation> {
    const newAnnonce: Prestation = {
      id_prestation: 0,
      nom_prestation: data.nom_prestation,
      description_presta: data.description_presta,
      prix: data.prix,
      id_type: data.id_type,
      nom_type: data.nom_type,
      prestataire
    };

    return this.http.post<Prestation>(`${this.apiUrl}/Add`, newAnnonce);
  }

  updateAnnonce(id: number, data: {
    nom_prestation: string;
    description_presta: string;
    prix: number;
    nom_type: string;
    id_type: number;
  }): Observable<Prestation> {
    // TODO: Ajouter un endpoint PUT dans le contrôleur
    const updatedAnnonce: Prestation = {
      id_prestation: id,
      nom_prestation: data.nom_prestation,
      description_presta: data.description_presta,
      prix: data.prix,
      id_type: data.id_type,
      nom_type: data.nom_type,
      prestataire: {} as Prestataire
    };
    
    return this.http.put<Prestation>(`${this.apiUrl}/Update/${id}`, updatedAnnonce);
  }

  deleteAnnonce(id: number): Observable<boolean> {
    // TODO: Ajouter un endpoint DELETE dans le contrôleur
    return this.http.delete<boolean>(`${this.apiUrl}/Delete/${id}`);
  }

  getServiceTypes(): Observable<{ id: number; nom: string }[]> {
    // TODO: Créer un endpoint pour les types de services
    return of([
      { id: 1, nom: 'Musique - DJ' },
      { id: 2, nom: 'Photographie' },
      { id: 3, nom: 'Vidéographie' },
      { id: 4, nom: 'Animation' },
      { id: 5, nom: 'Décoration' },
      { id: 6, nom: 'Catering' },
      { id: 7, nom: 'Transport' }
    ]);
  }
}
