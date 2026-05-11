export interface Prestation {
  id_prestation: number;
  nom_prestation: string;
  description_presta: string;
  prix: number;
  id_type: number;
  nom_type: string;
  prestataire: Prestataire;
}

export interface Prestataire {
  id: number;
  nom: string;
  prenom: string;
  email: string;
  note?: number;
  nombreAvis?: number;
}

export interface Reservation {
  id_reservation: number;
  id_client: number;
  id_prestation: number;
  nom_prestation: string;
  prestataire_nom: string;
  prestataire_prenom: string;
  date_reservation: Date;
  heure_reservation: string;
  lieu_reservation: string;
  nombre_personnes: number;
  budget: number;
  notes: string;
  statut: 'confirmée' | 'en attente' | 'annulée' | 'complétée';
  date_creation: Date;
}
