//
//  ViewController.swift
//  Class8
//
//  Created by Mac09 on 2023/5/3.
//

import UIKit
import MapKit
import SafariServices


class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
//
//    @objc func buttonPress(_ sender: UIButton) {
//        if sender.tag == 100 {
//            let url = URL(string: "https://www.ntust.edu.tw")
//            let safari = SFSafariViewController(url: url!)
//            show(safari, sender: self)
//        }
//    }
//
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        if annotation is MKUserLocation {
//            return nil
//        }
//        var annView = mapView.dequeueReusableAnnotationView(withIdentifier: "pin")
//        if annView == nil {
//            annView = MKAnnotationView(annotation: annotation, reuseIdentifier: "pin")
//        }
//
//        if (annotation.title! == "NTUST") {
//            let annView1 = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
//            let imageView = UIImageView(image: resizeImage(image: UIImage(named: "mark.png")!, width: 64))
//            annView1.leftCalloutAccessoryView = imageView
//
//            let label = UILabel()
//            label.numberOfLines = 2
//            label.text = "緯度: \(annotation.coordinate.latitude)\n經度:\(annotation.coordinate.longitude)"
//            annView1.detailCalloutAccessoryView = label
//
//            let button = UIButton(type: .detailDisclosure)
//            button.tag = 100
//            button.addTarget(self, action: #selector(buttonPress), for: .touchUpInside)
//
//            annView1.rightCalloutAccessoryView = button
//            annView1.isEnabled = true
//            annView1.canShowCallout = true
//            return annView1
//        }
//        return annView
//    }
//
//    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
//        // MKPolygonRenderer 幾何區域
//        // MKPolygonRenderer 圖形區域
//        // MKPolygonRenderer 線條
//        let render = MKPolygonRenderer(overlay: overlay)
//
//        if overlay is MKPolygon {
//            // Filling color
//            render.fillColor = UIColor.red.withAlphaComponent(0.2)
//
//            // Stroke color
//            render.strokeColor = UIColor.red.withAlphaComponent(0.7)
//
//            // Stroke width
//            render.lineWidth = 3
//        }
//        return render
//    }
//
//
//
//    func resizeImage(image: UIImage, width: CGFloat) -> UIImage {
//        let size = CGSize(width: width, height: image.size.height * width / image.size.width)
//        let renderer = UIGraphicsImageRenderer(size: size)
//        let newImage = renderer.image{(context) in image.draw(in: renderer.format.bounds)}
//        return newImage
//    }
//
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Coordinate of Tower
        let ground = CLLocationCoordinate2D(latitude: 48.858356, longitude: 2.294481)
        
        // Coordinate of camera
        let eyeFrom = CLLocationCoordinate2D(latitude: 48.85, longitude: 2.29)
        
        // Set position and height of camera
        let camera = MKMapCamera(lookingAtCenter: ground, fromEyeCoordinate: eyeFrom, eyeAltitude: 30)
        
        mapView.mapType = .satelliteFlyover
        
        mapView.camera = camera
//        var point = [CLLocationCoordinate2D]()
//        point.append(CLLocationCoordinate2D(latitude: 24.2013, longitude: 120.5810))
//        point.append(CLLocationCoordinate2D(latitude: 24.2044, longitude: 120.6559))
//        point.append(CLLocationCoordinate2D(latitude: 24.1380, longitude: 120.6401))
//        point.append(CLLocationCoordinate2D(latitude: 24.1424, longitude: 120.5783))
//        let polygon = MKPolygon(coordinates: &point, count: point.count)
//        mapView?.addOverlay(polygon)
//
//        // Standard
//        mapView?.mapType = .standard
//        // Satellite
//        mapView?.mapType = .satellite
//        // Mixed
//        mapView?.mapType = .hybrid
        
        // Set coordinate
//        let taipei101 = CLLocationCoordinate2D(latitude: 25.033850, longitude: 121.564977)
//        let airstration = CLLocationCoordinate2D(latitude: 25.068554, longitude: 121.552932)
//
//        let pA = MKPlacemark(coordinate: taipei101, addressDictionary: nil)
//        let pB = MKPlacemark(coordinate: airstration, addressDictionary: nil)
//
//        let miA = MKMapItem(placemark: pA)
//        let miB = MKMapItem(placemark: pB)
//        miA.name = "台北101"
//        miB.name = "松山機場"
//
//        let routes = [miA, miB]
//
//        let options = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
//
//        MKMapItem.openMaps(with: routes, launchOptions: options)
        
    }

}

