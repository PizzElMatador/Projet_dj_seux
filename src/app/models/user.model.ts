export interface User {
  id_utilisateur: number;
  nom: string;
  prenom: string;
  email: string;
  date_inscription: Date;
  id_role: number;
  role?: 'Admin' | 'Manager' | 'User';
  is_banned?: boolean;
}

export interface Client extends User {
  id: number;
  role?: 'Admin' | 'Manager' | 'User';
  is_banned?: boolean;
  telephone?: string;
  adresse?: string;
}

export interface Prestataire extends User {
  id: number;
  is_banned?: boolean;
  role?: 'Admin' | 'Manager' | 'User';
  telephone?: string;
  adresse?: string;
}

export interface LoginRequest {
  email: string;
  mot_de_passe: string;
}

export interface RegisterRequest {
  nom: string;
  prenom: string;
  email: string;
  password: string;        // ← renommé (était mot_de_passe)
  confirmPassword: string;
}

export interface AuthResponse {
  success: boolean;
  accessToken?: string;    // ← ajouté pour correspondre à la réponse C#
  refreshToken?: string;   // ← ajouté
  user?: Client | Prestataire;
  token?: string;
  message: string;
}