//
//  ContentView.swift
//  HowToStoreDataUsingUserDefaults
//
//  Created by ramil on 30.10.2019.
//  Copyright © 2019 com.ri. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var msg = ""
    @State var retrieved = ""
    var body: some View {
        
        VStack {
            Text(self.retrieved)
                .fontWeight(.heavy)
                .padding()
            
            TextField("Enter msg To Save", text: $msg)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                UserDefaults.standard.set(self.msg, forKey: "msg")
                self.retrieved = self.msg
                self.msg = ""
            }) {
                Text("Save").padding(15)
            }.background(Color.orange)
            .foregroundColor(.white)
            .cornerRadius(9)
        }
        .onAppear {
            // this will perform whenever this appears on the screen...
            // like viewDidLoad() in UIKit...
            // it's saving and retriving...
            
            guard let retrievedmsg = UserDefaults.standard.value(forKey: "msg") else { return }
            self.retrieved = retrievedmsg as! String
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
