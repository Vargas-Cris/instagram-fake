//
//  UserViewController.swift
//  ProjectMVVM
//
//  Created by MAC12 on 7/05/22.
//

import UIKit

class UserViewController : UIViewController{
    var user :User? = nil
    @IBOutlet weak var imageUser: UIImageView!
    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var lblDateOfBirth: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblLastName: UILabel!
    @IBOutlet weak var lblfirstName: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    
    let userViewModel :PostsViewModel = PostsViewModel()
    
    override func viewDidLoad() {
        imageUser.layer.cornerRadius = imageUser.frame.size.width / 2
        super.viewDidLoad()
        Task{
            await setUpView()
        }
        
    }
    func setUpView()async{
        await userViewModel.getUser()
        user = userViewModel.user
        setUpUser()
    }
     
    func setUpUser(){
        lblTitle.text = user?.title
        lblfirstName.text = user?.firstName
        lblLastName.text = user?.lastName
        lblEmail.text = user?.email
        lblGender.text =  user?.gender
        lblDateOfBirth.text = user?.dateOfBirth
        lblPhone.text = user?.phone
        imageUser.image = HelperImage.setImageFromUrl(url: (user?.picture)!)
        
    }
}
