namespace :stefan do
    
  desc "elenco degli utenti"
  task :utenti => :environment do
    User.order(:id).all.each do |u|
      puts "utente #{u.email}"
    end
  end

  desc "crea il cartellino di un mese"
  task :cartellino => :environment do
  	puts "digita utente"
  	utente = STDIN.gets.chomp
    u = User.where(email: utente).take
    puts u.name
  	puts "digita anno"
  	anno = STDIN.gets.chomp
  	puts "digita mese in numero di due cifre"
  	mese = STDIN.gets.chomp
  	t = Timesheet.new
  	t.user_id = u.id
  	t.year    = anno.to_i
    t.month   = mese.to_i
    t.status  = 'open'
    t.save!
    cart = t.id
    puts "cartellino (testata) #{cart} creato"
    ds_inizio = anno + mese + '01'
    dt_inizio = Date.parse(ds_inizio)
    puts dt_inizio
    dt_fine = dt_inizio.end_of_month
    puts dt_fine
    giorno = dt_inizio
    d = Timeday.new
    d.timesheet_id = cart
    d.day = giorno
    d.save!
    until giorno == dt_fine do
    	p giorno.next_day
    	giorno = giorno.next_day
    	d = Timeday.new
    	d.timesheet_id = cart
    	d.day = giorno
    	d.save!
    end
    puts "cartellino (dettaglio) #{cart} creato"
  end

  desc "cancella il cartellino di un mese"
  task :del_cart => :environment do
  	puts "digita anno"
  	anno = STDIN.gets.chomp
  	puts "digita mese in numero di due cifre"
  	mese = STDIN.gets.chomp
  	t = Timesheet.where(year: anno, month: mese, user_id: 1).take
  	p t.id
  	t.destroy
  end

  desc "crea il cartellino di un anno"
  task :cartellino_per_anno => :environment do
    mesi = ['01','02','03','04','05','06','07','08','09','10','11','12']
    puts "digita utente"
    utente = STDIN.gets.chomp
    u = User.where(email: utente).take
    puts u.name
    puts "digita anno"
    anno = STDIN.gets.chomp
    mesi.each do |mese|
      t = Timesheet.new
      t.user_id = u.id
      t.year    = anno.to_i
      t.month   = mese.to_i
      t.status  = 'open'
      t.save!
      cart = t.id
      puts "cartellino (testata) #{cart} creato"
      ds_inizio = anno + mese + '01'
      dt_inizio = Date.parse(ds_inizio)
      puts dt_inizio
      dt_fine = dt_inizio.end_of_month
      puts dt_fine
      giorno = dt_inizio
      d = Timeday.new
      d.timesheet_id = cart
      d.day = giorno
      d.save!
      until giorno == dt_fine do
        p giorno.next_day
        giorno = giorno.next_day
        d = Timeday.new
        d.timesheet_id = cart
        d.day = giorno
        d.save!
      end
      puts "cartellino (dettaglio) #{cart} creato"
    end
    puts "cartellini per anno #{anno} creati"
  end

  desc "cancella i cartellini di un anno"
  task :del_cart_anno => :environment do
    puts "digita utente"
    utente = STDIN.gets.chomp
    u = User.where(email: utente).take
    puts u.name
    puts "digita anno"
    anno = STDIN.gets.chomp
    Timesheet.destroy_all "user_id = #{u.id} and year = #{anno}"
  end
end
