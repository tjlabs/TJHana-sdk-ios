
import Foundation
import TJLabsCommon
import TJLabsJupiter
import TJLabsHana

// MARK: - To Common
extension UserMode {
    func toJupiter() -> TJLabsCommon.UserMode {
        return TJLabsCommon.UserMode(rawValue: self.rawValue) ?? .MODE_AUTO
    }
}

// MARK: - To Wrap (Warp)
extension TJLabsHana.WarpInitErrorCode {
    func toWrap() -> WarpInitErrorCode {
        return WarpInitErrorCode(rawValue: self.rawValue) ?? .UNKNOWN
    }
}

extension TJLabsHana.WarpErrorCode {
    func toWrap() -> WarpErrorCode {
        return WarpErrorCode(rawValue: self.rawValue) ?? .UNKNOWN
    }
}

extension TJLabsHana.WarpWard {
    func toWrap() -> WarpWard {
        
    }
}

// MARK: - To Wrap (Venus)
extension TJLabsHana.VenusInitErrorCode {
    func toWrap() -> VenusInitErrorCode {
        return VenusInitErrorCode(rawValue: self.rawValue) ?? .UNKNOWN
    }
}

extension TJLabsHana.VenusErrorCode {
    func toWrap() -> VenusErrorCode {
        return VenusErrorCode(rawValue: self.rawValue) ?? .UNKNOWN
    }
}

extension TJLabsHana.VenusResult {
    func toWrap() -> VenusResult {
        return VenusResult(mobile_time: self.mobile_time,
                           building_id: self.building_id,
                           building_name: self.building_name,
                           level_id: self.level_id,
                           level_name: self.level_name,
                           x: self.x, y: self.y)
    }
}

// MARK: - To Wrap (Jupiter)
extension TJLabsJupiter.InOutState {
    func toWrap() -> InOutState {
        return InOutState(rawValue: self.rawValue) ?? .UNKNOWN
    }
}

extension TJLabsJupiter.InitErrorCode {
    func toWrap() -> InitErrorCode {
        return InitErrorCode(rawValue: self.rawValue) ?? .UNKNOWN
    }
}

extension TJLabsJupiter.JupiterErrorCode {
    func toWrap() -> JupiterErrorCode {
        return JupiterErrorCode(rawValue: self.rawValue) ?? .UNKNOWN
    }
}

extension TJLabsJupiter.JupiterServiceCode {
    func toWrap() -> JupiterServiceCode {
        return JupiterServiceCode(rawValue: self.rawValue) ?? .UNKNOWN
    }
}

extension TJLabsJupiter.Position {
    func toWrap() -> Position {
        return Position(
            x: self.x,
            y: self.y,
            heading: self.heading
        )
    }
}

extension TJLabsJupiter.LLH {
    func toWrap() -> LLH {
        return LLH(
            lat: self.lat,
            lon: self.lon,
            azimuth: self.azimuth
        )
    }
}

extension TJLabsJupiter.JupiterResult {
    func toWrap() -> JupiterResult {
        return JupiterResult(
            mobile_time: self.mobile_time,
            index: self.index,
            building_name: self.building_name,
            level_name: self.level_name,
            jupiter_pos: self.jupiter_pos.toWrap(),
            navi_pos: self.navi_pos?.toWrap(),
            llh: self.llh?.toWrap(),
            velocity: self.velocity,
            is_vehicle: self.is_vehicle,
            is_indoor: self.is_indoor,
            validity_flag: self.validity_flag
        )
    }
}
