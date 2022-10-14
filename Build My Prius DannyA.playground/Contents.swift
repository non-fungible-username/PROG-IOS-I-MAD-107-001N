// Create the recipe and ingredients to define a playground that allows you to select the
// model, color, packages, and accessories.

import UIKit

// Enums for Models, Colors, Packages, and Accessories used to set parameters for Prius class variables and have string values for their correct name
enum Models: String {
    case LEco = "L Eco"
    case LE = "LE"
    case LEAEWe = "LE AWD-e"
    case XLEAWDe = "XLE AWD-e"
    case NightshadeEditionAWDe = "Nightshade Edition AWD-e"
    case NightshadeEditionFWDe = "Nightshade Edition FWD"
    case Limited = "Limited"
}

enum Colors: String {
    case White = "White"
    case WindChillPearl = "Wind Chill Pearl"
    case ClassicSilverMetallic = "Classic Silver Metallic"
    case MagneticGrayMetallic = "Magnetic Gray Metallic"
    case MidnightBlackMetallic = "Midnight Black Metallic"
    case SupersonicRed = "Supersonic Red"
    case SeaGlassPearl = "Sea Glass Pearl"
    case ElectricStormBlue = "Electric Storm Blue"
}

enum Packages: String {
    case PremiumConveniencePackage = "Premium Convenience Package"
    case AdvancedTechnologyPackage = "Advanced Technology Package"
    case AllWeatherFloorLinerPackage = "All-Weather Floor Liner Package"
    case CarpetMatPackage = "Carpet Mat Package"
    case PreferredAccessoryPackageWithAllWeatherFloorLiners = "Preferred Accessory Package w/All-Weather Floor Liners"
    case PreferredAccessoryPackageWithCarpetMats = "Preferred Accessory Package w/Carpet Mats"
    case ProtectionPackage2 = "Protection Package #2"
    case ProtectionPackage3 = "Protection Package #3"
}

enum Accessories: String {
    case AeroSideSplitter = "Aero Side Splitter"
    case AlloyWheelLock = "Alloy Wheel Lock"
    case BlackoutWheelInserts = "Blackout Wheel Inserts"
    case BodySideMoldings = "Body Side Moldings"
    case CatShield = "Cat Shield"
    case DoorEdgeGuards = "Door Edge Guards"
    case PaintProtectionFilmFB = "Paint Protection Film (front bumper)"
    case PaintProtectionFilmHFMBDC = "Paint Protection Film (hood, fenders, mirror backs, and door cups)"
    case RearBumperApplique = "Rear Bumper Appliqué"
    case RearBumperProtector = "Rear Bumper Protector"
    case RemovableCrossBars = "Removable Cross Bars"
    case StainlessSteelCatShield = "Stainless Steel CatS hield"
    case YakimaFatCatEVO6 = "Yakima FatCat EVO 6 Black Premium Ski and Snowboard Mount"
    case YakimaFrontLoaderRooftopUprightBikeMount = "Yakima Front Loader Rooftop Upright Bike Mount"
    case YakimaJayLowJCradleRooftopKayakMount = "Yakima JayLow J-Cradle Rooftop Kayak Mount"
    case YakimaKeelOverCanoeCarrier = "Yakima KeelOver Canoe Carrier"
    case YakimaSkyBox16Carbonite = "Yakima SkyBox 16 Carbonite"
    case AllWeatherFloorLiner = "All-Weather Floor Liner"
    case CargoLiner = "Cargo Liner"
    case CargoNetEnvelope = "Cargo Net Envelope"
    case CargoTote = "Cargo Tote"
    case CarpetCargoMat = "Carpet Cargo Mat"
    case CarpetFloorMats = "Carpet Floor Mats"
    case CoinHolderAshtrayCup = "Coin Holder/Ashtray Cup"
    case EmergencyKit = "Emergency Kit"
    case FirstAidKitWithPPE = "First Aid Kit w/PPE"
    case FramelessHomelinkMirror = "Frameless Homelink Mirror"
    case IlluminatedDoorSills = "Illuminated Door Sills"
    case QuickChargeCablePackage = "Quick Charge Cable Package"
    case UniversalTabletHolder = "Universal Tablet Holder"
}

// Pruis class models selecting, removing, and displaying options for a Prius car
class Prius {
    // Declare variables for the car using enums as parameters
    var model: Models
    var color: Colors
    // Declare package and accessory variables as arrays with empty values so no initial init required
    var package: [Packages] = []
    var accessory: [Accessories] = []
    
    // Initialize the model and color
    init(model: Models, color: Colors) {
        self.model = model
        self.color = color
    }

    // Shows current car option selections
    func showSelections() {
        print("Your selected model: \(self.model.rawValue)")
        print("Your selected color: \(self.color.rawValue)")
        
        // Checks if package array has at least one entry
        if self.package.count > 0 {
            print("Your packages selections include: ", terminator: "")
            for choice in self.package {
                // prints chosen package selections and displays with correct grammar
                if choice == self.package[0] {
                    print("\(choice.rawValue)", terminator: "")
                } else {
                    print(", \(choice.rawValue)", terminator: "")
                }
            }
        } else { // prints message if package array is empty
            print("Your packages selections include: none", terminator: "")
        }
        
        // Checks if accessory array has at least one entry
        if self.accessory.count > 0 {
            print("\nYour accessories selections include: ", terminator: "")
            for choice in self.accessory {
                // prints chosen accessory selections and displays with correct grammar
                if choice == self.accessory[0] {
                    print("\(choice.rawValue)", terminator: "")
                } else {
                    print(", \(choice.rawValue)", terminator: "")
                }
            }
        } else { // prints message if accessory array is empty
            print("\nYour accessories selections include: none", terminator: "")
        }
        print("\n")
    }
    
    // Changes the selected model
    func changeModel(new_model: Models) {
        if self.model != new_model {
            self.model = new_model
            print("New model: \(new_model.rawValue)\n")
        } else { // catch if model already chosen
            print("Error: \(new_model.rawValue) was already chosen\n")
        }
    }
    
    // Changes the selected color
    func changeColor(new_color: Colors) {
        if self.color != new_color {
            self.color = new_color
            print("New color: \(new_color.rawValue)\n")
        } else { // catch if color already chosen
            print("Error: \(new_color.rawValue) was already chosen\n")
        }
    }
    
    // Adds one or many package selections to the object
    func addPackage(package: [Packages]) {
        for item in package {
            if self.package.contains(item) { // catch if a package already on list
                print("Error: \(item.rawValue) was previously added")
            } else {
                billsPrius.package.append(item)
                print("Added: \(item.rawValue)")
            }
        }
        print("")
    }
    
    // Adds one or many accessory selections to the object
    func addAccessory(accessory: [Accessories]) {
        for item in accessory {
            if self.accessory.contains(item) { // catch if a accessory already on list
                print("Error: \(item.rawValue) was previously added")
            } else {
                billsPrius.accessory.append(item)
                print("Added: \(item.rawValue)")
            }
        }
        print("")
    }
    
    // Removes a package selection from the object
    func removePackage(package: Packages) {
        // Displays if package attempting to be removed was not in array
        if !self.package.contains(package) {
            print("Error: \"\(package.rawValue)\" was not previously selected")
        }
        for item in self.package {
            var counter = 0
            if package == item {
                print("Removed: \(item.rawValue)")
                self.package.remove(at: counter)
            }
            counter += 1
        }
        print("")
    }
    
    // Removes a accessory selection from the object
    func removeAccessory(accessory: Accessories) {
        // Displays if accessory attempting to be removed was not in array
        if !self.accessory.contains(accessory) {
            print("Error: \"\(accessory.rawValue)\" was not previously selected")
        }
        for item in self.accessory {
            var counter = 0
            if accessory == item {
                print("Removed: \(item.rawValue)")
                self.accessory.remove(at: counter)
            }
            counter += 1
        }
        print("")
    }
}

var billsPrius = Prius(model: .NightshadeEditionFWDe, color: .ClassicSilverMetallic)

billsPrius.showSelections()

billsPrius.addAccessory(accessory: [.QuickChargeCablePackage])

billsPrius.showSelections()

billsPrius.addPackage(package: [.AdvancedTechnologyPackage, .PremiumConveniencePackage])

billsPrius.showSelections()

billsPrius.removePackage(package: .PremiumConveniencePackage)

billsPrius.showSelections()

billsPrius.removeAccessory(accessory: .QuickChargeCablePackage)

billsPrius.showSelections()

billsPrius.removePackage(package: .ProtectionPackage3)
billsPrius.removeAccessory(accessory: .UniversalTabletHolder)

billsPrius.addPackage(package: [.PremiumConveniencePackage, .AllWeatherFloorLinerPackage, .CarpetMatPackage])
billsPrius.addAccessory(accessory: [.UniversalTabletHolder, .CargoTote, .BodySideMoldings])
billsPrius.changeModel(new_model: .NightshadeEditionFWDe)
billsPrius.changeModel(new_model: .Limited)
billsPrius.changeColor(new_color: .ClassicSilverMetallic)
billsPrius.changeColor(new_color: .MidnightBlackMetallic)

billsPrius.showSelections()

