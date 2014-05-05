class CustomerPdf < Prawn::Document
  def initialize
  	super
  	text "Dati vanno qui"
  end

end

