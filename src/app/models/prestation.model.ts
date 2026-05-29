export interface Prestation {
  id_prestation: number;
  nom_prestation: string;
  description_presta: string;
  prix: number;
  id_type: number;
  nom_type: string;
  id_prestataire: number;
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
  date_reservation: string;
  date_prestation: string;
  rue: string;
  code_postal: number;
  ville: string;
  id_prestation: number;
  id_client: number;
  nom_prestation: string;
  client_nom: string;
  client_prenom: string;
  statut: string;
}
