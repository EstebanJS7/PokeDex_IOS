//
//  ViewController.swift
//  PokeDex_IOS
//
//  Created by Esteban Jiménez on 2023-08-23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var searchPokemon: UISearchBar!
    @IBOutlet weak var tableViewPokemon: UITableView!
    
    var pokemonManager = PokemonManager()
    
    var pokemons: [Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewPokemon.register(UINib(nibName: "CellPokemonTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        pokemonManager.delegado = self
        
        tableViewPokemon.delegate = self
        tableViewPokemon.dataSource = self
        
        pokemonManager.verPokemon()
    }
}

extension ViewController: pokemonManagerDelegado{
    func mostrarListaPokemon(lista: [Pokemon]) {
        pokemons = lista
        
        DispatchQueue.main.async {
            self.tableViewPokemon.reloadData()
        }
    }
    
    
}

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewPokemon.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellPokemonTableViewCell
        cell.nombrePokemon.text = pokemons[indexPath.row].name
        cell.ataquePokemon.text = "Ataque: \(pokemons[indexPath.row].attack)"
        cell.defensaPokemon.text = "Defensa: \(pokemons[indexPath.row].defense)"
        
        if let urlString = pokemons[indexPath.row].imageUrl as? String {
            if let imageUrl = URL(string: urlString){
                DispatchQueue.global().async{
                    guard let imagenData = try? Data(contentsOf: imageUrl) else{ return }
                    let image = UIImage(data: imagenData)
                    DispatchQueue.main.async {
                        cell.imgPokemon.image = image
                    }
                }
            }
            
        }
        return cell
    }
    
}
