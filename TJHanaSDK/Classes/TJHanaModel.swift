
import TJLabsCommon
import TJLabsJupiter

// MARK: - Hana
public enum HanaRegion: String {
    case KOREA = "KOREA"
    case US_EAST = "US_EAST"
    case CANADA = "CANADA"
}

// MARK: - Warp
public protocol TJWarpViewDelegate: AnyObject {
    func onInitSuccess(_ view: TJWarpView, _ isSuccess: Bool, _ code: WarpInitErrorCode?)
    func onWarpSuccess(_ view: TJWarpView, _ isSuccess: Bool, _ code: WarpErrorCode?)
    func onClick(_ view: TJWarpView, warpWards: [WarpWard])
}

public enum WarpInitErrorCode: Int {
    case UNKNOWN = -1
    case INVALID_ID = 0
    case RESOURCE_FAIL = 1
}

public enum WarpErrorCode: Int {
    case UNKNOWN = -1
    case NOT_INITIALIZED = 0
    case DUPLICATE_SERVICE = 1
    case BLE_NOT_AUTHORIZED = 2
    case GENERATOR_FAIL = 3
}

public struct WarpContents: Codable {
    public let wards: [WarpWard]
}

public struct WarpWard: Codable {
    public let id: Int
    public let name: String
    public let rssi: Int
    public let contents: [WardContents]
}

public struct WardContents: Codable {
    public let id: Int
    public let name: String
    public let url: URL
}

// MARK: - Venus
public protocol TJVenuseManagerDelegate: AnyObject {
    func onInitSuccess(_ manager: TJVenusManager, _ isSuccess: Bool, _ code: VenusInitErrorCode?)
    func onVenusSuccess(_ manager: TJVenusManager, _ isSuccess: Bool, _ code: VenusErrorCode?)
    func onVenusResult(_ manager: TJVenusManager, _ result: VenusResult)
}

public enum VenusInitErrorCode: Int {
    case UNKNOWN = -1
    case INVALID_ID = 0
    case RESOURCE_FAIL = 1
}

public enum VenusErrorCode: Int {
    case UNKNOWN = -1
    case NOT_INITIALIZED = 0
    case DUPLICATE_SERVICE = 1
    case BLE_NOT_AUTHORIZED = 2
    case GENERATOR_FAIL = 3
}

public struct VenusResult: Codable {
    public let mobile_time: Int
    public let building_id: Int
    public let building_name: String
    public let level_id: Int
    public let level_name: String
    public let x: Int
    public let y: Int
    
    public init(mobile_time: Int, building_id: Int, building_name: String, level_id: Int, level_name: String, x: Int, y: Int) {
        self.mobile_time = mobile_time
        self.building_id = building_id
        self.building_name = building_name
        self.level_id = level_id
        self.level_name = level_name
        self.x = x
        self.y = y
    }
}

// MARK: - Jupiter
public protocol TJJupiterManagerDelegate: AnyObject {
    func onInitSuccess(_ manager: TJJupiterManager, _ isSuucess: Bool, _ code: InitErrorCode?)
    func onJupiterSuccess(_ manager: TJJupiterManager, _ isSuccess: Bool, _ code: JupiterErrorCode?)
    func onJupiterReport(_ manager: TJJupiterManager, _ code: JupiterServiceCode, _ msg: String)
    func onJupiterResult(_ manager: TJJupiterManager, _ result: JupiterResult)
    func isJupiterInOutStateChanged(_ manager: TJJupiterManager, _ state: InOutState)
    func isUserGuidanceOut()
    func isNavigationRouteChanged(_ manager: TJJupiterManager, _ routes: [(String, String, Int, Float, Float)])
    func isNavigationRouteFailed()
    func isWaypointChanged(_ manager: TJJupiterManager, _ waypoints: [[Double]])
}

public enum JupiterRegion: String {
    case KOREA = "KOREA"
    case US_EAST = "US_EAST"
    case CANADA = "CANADA"
}

public enum UserMode: String {
    case MODE_PEDESTRIAN = "PDR"
    case MODE_VEHICLE = "DR"
    case MODE_AUTO = "AUTO"
}

public enum InOutState: Int {
    case UNKNOWN = -1
    case OUT_TO_IN = 0
    case INDOOR = 1
    case IN_TO_OUT = 2
    case OUTDOOR = 3
}

public enum InitErrorCode: Int {
    case UNKNOWN = -1
    case INVALID_ID = 0
    case INVALID_MODE = 1
    case NETWORK_DISCONNECT = 2
    case DUPLICATED_SERVICE = 3
    case LOGIN_FAIL = 4
    case CALC_INIT_FAIL = 5
}

public enum JupiterErrorCode: Int {
    case UNKNOWN = -1
    case INVALID_ID = 0
    case INVALID_MODE = 1
    case NETWORK_DISCONNECT = 2
    case DUPLICATED_SERVICE = 3
    case LOGIN_FAIL = 4
    case GENERATOR_FAIL = 5
    case CALC_INIT_FAIL = 6
}

public enum JupiterServiceCode: Int {
    case UNKNOWN = -1
    case SERVICE_FAIL = 0
    case SERVICE_SUCCESS = 1
    case BECOME_BACKGROUND = 2
    case BECOME_FOREGROUND = 3
    case BLUETOOTH_UNAVAILABLE = 4
    case BLUETOOTH_OFF = 5
    case BLUETOOTH_SCAN_STOP = 6
    case NETWORK_DISCONNECT = 7
}

public struct JupiterResult: Codable {
    public var mobile_time: Int
    public var index: Int
    public var building_name: String
    public var level_name: String
    public var jupiter_pos: Position
    public var navi_pos: Position?
    public var llh: LLH?
    public var velocity: Float
    public var is_vehicle: Bool
    public var is_indoor: Bool
    public var validity_flag: Int
}

public struct Position: Codable {
    public var x: Float
    public var y: Float
    public var heading: Float
}

public struct LLH: Codable {
    public var lat: Double
    public var lon: Double
    public var azimuth: Double
}

public struct RoutingStart: Codable {
    public let level_id: Int
    public let x: Int
    public let y: Int
    public var absolute_heading: Int
    
    public init(level_id: Int, x: Int, y: Int, absolute_heading: Int) {
        self.level_id = level_id
        self.x = x
        self.y = y
        self.absolute_heading = absolute_heading
    }
}

public struct Point: Codable {
    public let level_id: Int
    public let x: Int
    public let y: Int
    
    public init(level_id: Int, x: Int, y: Int) {
        self.level_id = level_id
        self.x = x
        self.y = y
    }
}
