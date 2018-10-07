

module damier(taille,epaisseur)
{
    // double boucle de 10 permettant de créer le dammier
    for (i = [1:10])
        {
            for (j = [1:10])
            {
                // couleurDamier permet d'alterner le noir et le blanc grace au modulo de i+j qui donne 1 avec i,j impair et 0 quand i+j sont pair
                couleurDamier = [(i+j)%2,(i+j)%2,(i+j)%2];
                
                blanc = 1;
                noir = 68/255;
                
                // couleurPion permet de mettre les pions dont le j est inferieur a 5 en blanc et les pions avec j  supérieur a 5 en noir
                couleurPion = [j<5?blanc:noir,j<5?blanc:noir,j<5?blanc:noir];
                
                // translation du cube de base [10,10] pour créer la surface total du dammier
                color(couleurDamier)translate ([i*taille,j*taille,0])cube([taille,taille,epaisseur]);
                
                // Permet de placer les pions sur les cases dont i+j est pair
                if((i+j)%2 == 0 && (j<5 || j>6))
                {
                    // le +0.5 permet de centrer les pions sur les cases du damier
                    color(couleurPion)translate ([(i+0.5)*taille,(j+0.5)*taille,epaisseur])cylinder(r1=taille/2,r2=taille/2,h=epaisseur);
                }
            }
        }
}

damier(10,1);