//
//  ViewController.swift
//  RAVirtuaLect
//
//  Created by virtual lecto on 5/14/19.
//  Copyright © 2019 virtual lecto. All rights reserved.
//
// La aplicacion fue desarrollada en el editor xcode v10 y desarrollada en el lenguaje de programacion swift.
// En nuestra primera interfaz tenemos la pantalla de bienvenida.
// En la siguiente interfaz tenemos la pantalla de inicio de sesion, el inicio de sesion se realiza mediante un correo electronico y una contraseña.
// En la interfaz de registro de usuario, es donde un nuevo usuario se puede registrar para acceder a la aplicacion, esto lo realiza poniendo su informacion personal.

// Para relizar el inicio de sesion y registro de usuario se realizo una coneccion con el servicio de firebase, mediante el uso de los siguientes packetes:
//


import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var logoPrincipal: UIImageView!
    

    
    @IBOutlet weak var emailTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    @IBOutlet weak var loginBtnText: UIButton!
    
    //END LOGIN
    
    @IBOutlet weak var loginText1: UITextField!
    
    
    @IBOutlet weak var loginText2: UIButton!
    
    
    @IBOutlet weak var loginText3: UITextField!
    
    @IBOutlet weak var loginText4: UIButton!
    
    
    //REGISTER
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var apellidoTextField: UITextField!
    
    @IBOutlet weak var emailRegisterTextField: UITextField!
    
    @IBOutlet weak var passRegTextField: UITextField!
    
    @IBOutlet weak var passconfRegTextField: UITextField!
    
    //END REGISTER

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        
        //passwordTextField.text = "hola"
        //passwordTextField.font = UIFont(name: "test", size: 18)
        //passwordTextField.font = .systemFont(ofSize: pow(screenHeight/480,2)*2+8)
        
        emailTextField.font = .systemFont(ofSize: pow(screenHeight/480,2)*2+8)
        
        
        loginBtnText.titleLabel?.font = .systemFont(ofSize: pow(screenHeight/480,2)*2+7)
        
        loginText1.font = .systemFont(ofSize: pow(screenHeight/480,2)*2+7)
        
        loginText2.titleLabel?.font = .systemFont(ofSize: pow(screenHeight/480,2)*2+7)
        
        loginText3.font = .systemFont(ofSize: pow(screenHeight/480,2)*2+7)
        
        loginText4.titleLabel?.font = .systemFont(ofSize: pow(screenHeight/480,2)*2+7)
        
//   var  tam = logoPrincipal.draw(CGRect( 400,200))
        // Do any additional setup after loading the view, typically from a nib.
    }

    
 
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        
        if let email = emailTextField.text, let pass = passwordTextField.text{
            
            
           
                Auth.auth().signIn(withEmail: email, password: pass) { (user, error) in
                    
                    if let u = user{
                        self.performSegue(withIdentifier: "goToHome", sender: self)
                    }
                    else{
                        
                    }
                    
                }
            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    

    
    
    
    @IBAction func goToRegister(_ sender: UIButton) {
       self.performSegue(withIdentifier: "goToRegister", sender: self)
    }
    
    
    @IBAction func clickRegister(_ sender: UIButton) {
        if let email = emailRegisterTextField.text,
            let pass = passRegTextField.text,
            let passconf = passconfRegTextField.text{
            Auth.auth().createUser(withEmail: email, password: pass) { (user, error) in
                if let u = user{
                    self.performSegue(withIdentifier: "goToHome2", sender: self)
                }
                else{
                    
                }
            }
                
            
        }
        
    }
    

    
    @IBAction func clickCancel(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToInit", sender: self)
    }
    
}

