
protocol AdvanceLifeSupport {
    func performCPR()
}

class EmergencyCallHandler{
    
    var delegate: AdvanceLifeSupport?
    
    func assesSituation(){
        
        print("Can you tell me what happened?")
    }
    
    func medicalEmergency(){
        delegate?.performCPR()
        
    }
}


struct Parademic: AdvanceLifeSupport {
    
    init(handler:EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("The Paramedic does chest compressions")
    }
    
    

}

class Doctor: AdvanceLifeSupport{
    
    init(handler: EmergencyCallHandler) {
        handler.delegate = self
    }
    
    func performCPR() {
        print("The Doctor does chest compressions")
    }
    
    func useSthethescope(){
        print ("Listen for heart sounds")
    }
}

class Surgeon:Doctor{
    
    override func performCPR() {
        super.performCPR()
        print("Sing back to black")
    }
}

let emilio = EmergencyCallHandler()
let angila = Surgeon(handler: emilio)
angila.performCPR()


let parademic = Parademic(handler: emilio)

emilio.assesSituation()
emilio.medicalEmergency()

