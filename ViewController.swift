//
//  ViewController.swift
//  tictactoe
//
//  Created by Isaïe Clarin on 09/03/2022.
//

import UIKit
import Network
import Combine

class ViewController: UIViewController {
	
//	var joueur: Int
//	var etatCase: [Int]
	
	var joueur = 1
	var etatCase = [0, 0, 0, 0, 0, 0, 0, 0, 0]
	
//	var joueur = -1
//	var etatCase: [Int] = []
//
	func initialisation(/*objet: Any*/) {
		joueur = 1
		etatCase = [0, 0, 0, 0, 0, 0, 0, 0, 0]
		for i in 1 ... 9 {
			let bouton = view.viewWithTag(i) as! UIButton
			bouton.setImage(nil, for: UIControl.State())
		}
	}
	
	@IBAction func Action(_ sender: Any) {
		if (etatCase[(sender as AnyObject).tag - 1] == 0){
			
			etatCase[(sender as AnyObject).tag - 1] = joueur
			
			if joueur == 1{
				(sender as AnyObject).setImage(UIImage(named: "croix"), for: UIControl.State())
				
//				if win(tab: etatCase) {
//					print("Joueur " + String(joueur) + " a gagné")
//					let buttonEndGame: UIAlertController = UIAlertController(title: "Fin de jeu", message: "Joueur " + String(joueur) + " a gagné", preferredStyle: UIAlertController.Style.alert)
//					buttonEndGame.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
//						NSLog("The \"OK\" alert occured.")
//						exit(0)
//						}))
//					present(buttonEndGame, animated: true, completion: nil)
					
					//faire finir le jeu
//				}
				
				joueur = 2
			}
			else{
				(sender as AnyObject).setImage(UIImage(named: "cercle"), for: UIControl.State())
				
				joueur = 1
			}
			
			if win(tab: etatCase) {
				print("Joueur " + String(joueur) + " a gagné")
				
				let buttonEndGame: UIAlertController = UIAlertController(title: "Fin de jeu", message: "Joueur " + String(joueur) + " a perdu", preferredStyle: UIAlertController.Style.alert)
				buttonEndGame.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] _ in
					NSLog("The \"OK\" alert occured.")
//					exit(0)
					self.initialisation()
					}))
				present(buttonEndGame, animated: true, completion: nil)
				
				//faire finir le jeu
			}
			else{
				if !(etatCase.contains(0)) {
				
					print("Match nul")
					
					let buttonEndGame: UIAlertController = UIAlertController(title: "Fin de jeu", message: "Match nul", preferredStyle: UIAlertController.Style.alert)
					buttonEndGame.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] _ in
						NSLog("The \"OK\" alert occured.")
//						exit(0)
						self.initialisation()
					}))
					present(buttonEndGame, animated: true, completion: nil)
					//Refresh()
					
				}
			}
		}
	}
	
	func win(tab: [Int]) -> Bool {
		if (((tab[0] == tab[1] && tab[1] == tab[2]) && (tab[0] != 0)) || //Ligne 1
			((tab[3] == tab[4] && tab[4] == tab[5]) && (tab[3] != 0)) || //Ligne 2
			((tab[6] == tab[7] && tab[7] == tab[8]) && (tab[6] != 0)) || //Ligne 3
			((tab[0] == tab[3] && tab[3] == tab[6]) && (tab[0] != 0)) || //Colonne 1
			((tab[1] == tab[4] && tab[4] == tab[7]) && (tab[1] != 0)) || //Colonne 2
			((tab[2] == tab[5] && tab[5] == tab[8]) && (tab[2] != 0)) || //Colonne 3
			((tab[0] == tab[4] && tab[8] == tab[4]) && (tab[0] != 0)) || //Diagonale 1
			((tab[2] == tab[4] && tab[4] == tab[6]) ) && (tab[2] != 0)) {  //Diagonale 2
			return true
		}
		return false
	}
	
//	func initialisation() {
//		joueur = 1
//		etatCase = [0, 0, 0, 0, 0, 0, 0, 0, 0]
//	}
	
	func Refresh() {
			// Do some reloading of data and update the table view's data source
			// Fetch more objects from a web service, for example...

		self.dismiss(animated: true, completion: nil)
		self.navigationController!.dismiss(animated: true, completion: nil)
		navigationController!.popViewController(animated: true)
		self.navigationItem.hidesBackButton = true

		}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}


}
