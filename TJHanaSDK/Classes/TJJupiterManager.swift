
import Foundation
import TJLabsJupiter
    
public class TJJupiterManager: NavigationManagerDelegate {
    public func onInitSuccess(_ isSuccess: Bool, _ code: TJLabsJupiter.InitErrorCode?) {
        delegate?.onInitSuccess(self, isSuccess, code?.toWrap())
    }
    
    public func onJupiterSuccess(_ isSuccess: Bool, _ code: TJLabsJupiter.JupiterErrorCode?) {
        delegate?.onJupiterSuccess(self, isSuccess, code?.toWrap())
    }
    
    public func onJupiterResult(_ result: TJLabsJupiter.JupiterResult) {
        delegate?.onJupiterResult(self, result.toWrap())
    }
    
    public func onJupiterReport(_ code: TJLabsJupiter.JupiterServiceCode, _ msg: String) {
        delegate?.onJupiterReport(self, code.toWrap(), msg)
    }
    
    public func isJupiterInOutStateChanged(_ state: TJLabsJupiter.InOutState) {
        delegate?.isJupiterInOutStateChanged(self, state.toWrap())
    }
    
    public func isUserGuidanceOut() {
        delegate?.isUserGuidanceOut()
    }
    
    public func isNavigationRouteChanged(_ routes: [(String, String, Int, Float, Float)]) {
        delegate?.isNavigationRouteChanged(self, routes)
    }
    
    public func isNavigationRouteFailed() {
        delegate?.isNavigationRouteFailed()
    }
    
    public func isWaypointChanged(_ waypoints: [[Double]]) {
        delegate?.isWaypointChanged(self, waypoints)
    }
    
    private var region: String = ""
    private var id: String = ""
    private var sectorId: Int = 0
    public weak var delegate: TJJupiterManagerDelegate?
    
    var serviceManager: NavigationManager?
    
    public init(id: String, region: String = HanaRegion.KOREA.rawValue, sectorId: Int, debugOption: Bool = false) {
        self.id = id
        self.sectorId = sectorId
        
        self.serviceManager = NavigationManager(id: id, region: region, sectorId: sectorId, debugOption: debugOption)
        self.serviceManager?.delegate = self
    }
    
    deinit {
        serviceManager?.delegate = nil
        
        serviceManager?.stopService(completion: {_, _ in})
        serviceManager = nil
    }
    
    public func startService(mode: UserMode) {
        serviceManager?.startService(mode: mode.toJupiter())
    }
    
    public func stopService(completion: @escaping (Bool, String) -> Void) {
        serviceManager?.stopService(completion: completion)
    }
}
