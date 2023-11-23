/*Dans la classe Program créer :

Le stock sous forme d'une collection d’articles de votre choix.

Un menu présentant les fonctionnalités suivantes :

Rechercher un article par référence.
Ajouter un article au stock en vérifiant l’unicité de la référence.
Supprimer un article par référence.
Modifier un article par référence.
Rechercher un article par nom.
Rechercher un article par intervalle de prix de vente.
Afficher tous les articles.
Quitter
*/
import 'dart:io';

class Article {
  int numero;
  String nom;
  double prix;
  int quantite;

  Article.init(int n, String no, double p, int q)
      : numero = n,
        nom = no,
        prix = p,
        quantite = q;

  @override
  String toString() {
    return "\r\nNuméro: $numero\r\nNom: $nom\r\nPrix: $prix\r\nQuantité: $quantite";
  }


int rechercher(List<Article> stock, int r) {
  int p = -1;
  for (int i = 0; i < stock.length; i++) {
    if (stock[i].numero == r) {
      p = i;
      break;
    }
  }
  return p;
}
}

void main() {
  int choix, num, quantite, p;
  double prix;
  String nom;
  List<Article> stock = [];

  do {
    print("*******************************Menu*****************************");
    print("1-Rechercher un article par numéro");
    print("2-Ajouter un article");
    print("3-Supprimer un article par numéro");
    print("4-Modifier un article par numéro");
    print("5-Rechercher un article par nom");
    print("6-Rechercher un article par intervalle de prix de vente");
    print("7-Afficher tous les articles");
    print("8-Quitter");
    stdout.write("Donner votre choix: ");
    choix = int.parse(stdin.readLineSync()!);

    switch (choix) {
      case 1:
        stdout.write("Donner le numéro de l'article à rechercher: ");
        num = int.parse(stdin.readLineSync()!);
        p = rechercher(stock, num);
        if (p == -1) {
          print("Article introuvable");
        } else {
          print(stock[p]);
        }
        break;

      case 2:
        stdout.write("Donner le numéro de l'article à ajouter: ");
        num = int.parse(stdin.readLineSync()!);
        p = rechercher(stock, num);
        if (p != -1) {
          print("Article existe déjà");
        } else {
          stdout.write("Donner le nom : ");
          nom = stdin.readLineSync()!;
          stdout.write("Donner le prix: ");
          prix = double.parse(stdin.readLineSync()!);
          stdout.write("Donner la quantité: ");
          quantite = int.parse(stdin.readLineSync()!);
          stock.add(Article.init(num, nom, prix, quantite));
          print("Article ajouté avec succès");
        }
        break;

      case 3:
        stdout.write("Donner le numéro de l'article à supprimer:");
        num = int.parse(stdin.readLineSync()!);
        p = rechercher(stock, num);
        if (p == -1) {
          print("Article introuvable");
        } else {
          stock.removeAt(p);
          print("Article supprimé avec succès");
        }
        break;

      case 4:
        stdout.write("Entrer le numéro de l'article à modifier: ");
        num = int.parse(stdin.readLineSync()!);
        p = rechercher(stock, num);
        if (p == -1) {
          print("Article introuvable");
        } else {
          int c;
          do {
            print("*****Options*****");
            print("1-Modifier le nom");
            print("2-Modifier le prix");
            print("3-Modifier la quantité");
            print("4-Terminer");
            stdout.write("Donner votre choix: ");
            c = int.parse(stdin.readLineSync()!);
            switch (c) {
              case 1:
                stdout.write("Donner le nouveau nom: ");
                stock[p].nom = stdin.readLineSync()!;
                print("Nom modifié avec succès");
                break;
              case 2:
                stdout.write("Donner le prix: ");
                stock[p].prix = double.parse(stdin.readLineSync()!);
                print("Prix modifié avec succès");
                break;
              case 3:
                stdout.write("Donner la quantité: ");
                stock[p].quantite = int.parse(stdin.readLineSync()!);
                print("Quantité modifiée avec succès");
                break;
              case 4:
                print("Modifications terminées");
                break;
              default:
                print("Choix invalide");
                break;
            }
          } while (c != 4);
        }
        break;

      case 5:
        stdout.write("Donner le nom de l'article à rechercher: ");
        nom = stdin.readLineSync()!;
        int comp = 0;
        for (int i = 0; i < stock.length; i++) {
          if (stock[i].nom.toLowerCase() == nom.toLowerCase()) {
            print(stock[i].toString());
            comp++;
          }
        }
        if (comp == 0) {
          print("Aucun résultat");
        }
        break;

      case 6:
        double min, max;
        int cpt = 0;
        stdout.write("Donner le prix min :");
        min = double.parse(stdin.readLineSync()!);
        stdout.write("Donner le prix max: ");
        max = double.parse(stdin.readLineSync()!);
        if (min < 0 || max < 0 || min > max) {
          print("Intervalle invalide");
        } else {
          for (int i = 0; i < stock.length; i++) {
            if (stock[i].prix >= min && stock[i].prix <= max) {
              cpt++;
              print(stock[i]);
            }
          }
          if (cpt == 0) {
            print("Aucun résultat");
          }
        }
        break;

      case 7:
        for (Article a in stock) {
          print(a);
        }
        if (stock.isEmpty) {
          print("Aucun résultat");
        }
        break;

      case 8:
        print("Fin du programme");
        break;

      default:
        print("Choix invalide");
        break;
    }
  } while (choix != 8);
}
