import UIKit
import Combine

/*Hi Daniel
Combine is Apple's reactive framework
a very simple concept that combine needs Publisher, Subscriber and Operators
The Publisher sends values that the Subscriber listen
and can also send values in three ways when is complete, when is an error, or the subscription has been canceled

The Subscriber receives notifications for each value received, including errors or sub job cancellations.
 
 There are also other Publisher types
 CurrenValueSubjet using default value

 or PassthroughSubjet can be initialized without values.
 these Publishers use the method send
 
 so a diagram combine look something like this*/

//Publisher                                                Subcriber
//========value>> =====================================value>>==============



// Demo 1#################################################################

/*simple publisher and a subcriber*/

let myArray = ["A", "B", "C", "D"]
let myPublisher = myArray.publisher //Publisher
let just = Just(["1", "2", "3"]) //other ways to create publisher using just


myPublisher.sink { isFinished in //Subcriber
    print ("isFinished: \(isFinished)")
} receiveValue: { value in
    print ("value received: \(value)")
}

// Demo 2#################################################################
//other more direct ways to create Publisher and Subcriber

class PublisherDemo {
    var demoIntValue: Int = 0
}
let justInteger = Just(1000)
let swiftDemo = PublisherDemo()
print(justInteger)

//#################################################################

//Another example

// We define a publication object that represents the current temperature
@Published var temperaturaActual: Double = 0.0

// We created a subscription to receive temperature updates
cancellable = locationManager.$ubicacionActual
    // We map the location to the current temperature using a weather API.
    .flatMap { ubicacion in
        URLSession.shared.dataTaskPublisher(for: climaAPI.obtenerTemperaturaActual(ubicacion: ubicacion))
            .map { $0.data }
            .decode(type: Clima.self, decoder: JSONDecoder())
            .map { $0.temperatura }
    }
    // We update the publication object with the current temperature.
    .assign(to: \.temperaturaActual, on: self)


