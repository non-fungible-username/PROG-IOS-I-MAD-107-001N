// Create the recipe and ingredients to define a playground that allows you to select the
// model, color, packages, and accessories.

import UIKit

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

struct PackageOptions {
    var package: [Packages]
    
    init(items: [Packages]) {
        self.package = items
    }
}

struct AccessoryOptions {
    var accessory: [Accessories]
    
    init(items: [Accessories]) {
        self.accessory = items
    }
}

class Prius {
    var model: Models
    var color: Colors
    var package: [PackageOptions]?
    var accessory: [AccessoryOptions]?
    
    init(model: Models, color: Colors) {
        self.model = model
        self.color = color
       // self.package = package
       // self.accessory = accessory
    }

    func showSelections() {
        print("Your model selection is \(self.model.rawValue)")
        print("Your color selection is \(self.color.rawValue)")
        if let packageChoices = self.package {
           for item in packageChoices {
               print("Your packages selections include: \(item)")
            }
        } else {
            print("No packages have been selected")
        }
        if let accessoryChoices = self.accessory {
            for choices in accessoryChoices {
                print("Your accessory selections include: \(choices)")
            }
        } else {
            print("No accessories have been selected")
        }
        print("")
    }
}

var myPrius = Prius(model: .LEco, color: .MagneticGrayMetallic)
myPrius.showSelections()

var myPackages = PackageOptions(items: [.PreferredAccessoryPackageWithCarpetMats])
var myAccessories = AccessoryOptions(items: [.BlackoutWheelInserts, .CargoLiner, .BodySideMoldings])

myPrius.package = [myPackages]
myPrius.accessory = [myAccessories]
myPrius.showSelections()
