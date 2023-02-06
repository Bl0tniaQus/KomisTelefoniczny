class CreateTelefons < ActiveRecord::Migration[7.0]
  def change
    create_table :telefons do |t|
      t.string :producent
      t.string :nazwa
      t.string :system
      t.float :ekran
      t.float :rozdzielczosc
      t.float :ram
      t.float :pamiec
      t.float :bateria
      t.string :microsd
      t.string :dualsim
      t.string :kolor
      t.float :aparat
      t.string :audio
      t.string :nfc
      t.string :lacznosc
      t.string :klawiatura
      t.string :opis
      t.boolean :czy_uzywany
      t.boolean :czy_uszkodzony
      t.float :cena
      t.string :zdjeciebin
      t.timestamps
    end
  end
end
