

class Compte {
  int solde = 0;


  void deposer(int montant) {
    solde = solde + montant;
  }

  void retirer(int montant) {
    solde = solde - montant;
  }

  void virerVers(int montant, Compte destination) {
    this.retirer(montant);
    destination.deposer(montant);
  }

  void afficher() {
    print("solde: $solde");
  }
}
void main(){
  List table = List.filled(11, Compte());
  print(table);
    Compte c=Compte();
  Compte martin=Compte();
  Compte jean=Compte();;
    martin.deposer(400);
  c.deposer(500);
  c.retirer(100);
    c.afficher();
  martin.virerVers(75, jean);
  jean.afficher();
  martin.afficher();
  print("----------------------------------");
//Question03
  for (int i = 0; i < table.length; i++) {
    table[i] = Compte();
    table[i].deposer(200 + i * 100);
   
  } print("la valeur ${table[0].afficher()} apres :");

}



class Article {
    int numero_ref ;
    String nom;
    int prix_de_vente;
    int quant_stock;
    Article(this.numero_ref,this.nom,this.prix_de_vente,this.quant_stock);
  
    @override
    String  toString(){
        return " nom de larticle : $nom , numero  : $numero_ref vendu a $prix_de_vente quantité disponible $quant_stock ";
    }

}
void main(){
     List<Article> articleCollection = [];
    Article a2=Article(1,"article 1",14000,4);

    articleCollection.add(Article(1,"article 1",14000,4));
    for(var article in articleCollection ){
       print(article.toString());
    
  }
 

}