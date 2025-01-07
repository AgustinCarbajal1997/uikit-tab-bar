import UIKit

class GFButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        configure()
    }
    
    private func configure(){
        layer.cornerRadius          = 10
        setTitleColor(.white, for: .normal)
        titleLabel?.font            = UIFont.preferredFont(forTextStyle: .headline)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func set(backgroundColor: UIColor, title: String) { // lo ponemos con set tambien pq aunque lo tenemos en el init, muchas veces lo podemos inicializar sin pasar background color y title y dps sobre la marcha podemos necesitar cambiar los valores
        self.backgroundColor = backgroundColor
        setTitle(title, for: .normal)
    }
    
}
