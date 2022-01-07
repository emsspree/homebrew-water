cask "dictionary-openthesaurus-de-tekl" do
  version "2021.12.09"
  sha256 :no_check

  # module VarModul
  #   @@caveat1 = "Englischer Text"

  #   def self.setCaveat1(value)
  #     @@caveat = value
  #   end  

  #   def self.caveat1
  #     @@caveat1
  #   end  
  # end  

  # VarModul.name                      # ausgeben
  # VarModul.setName("Deutscher Text") # neu setzen
  # VarModul.name                      # ausgeben


  # if MacOS.version <= :sierra
  # # ...
  # elsif MacOS.version <= :mojave
  # # ...
  # else
  # # ...
  # end

  # language "de" do
  #   caveats <<~EOS
  #     OpenThesaurus Deutsch wird für alle Benutzer installiert.
  #     Wenn es nur für den aktuellen Benutzer installiert werden soll, führe folgendes aus:
  #       mv /Library/Dictionaries/OpenThesaurus\ Deutsch.dictionary ~/Library/Dictionaries/

  #     Eventuell muss OpenThesaurus Deutsch in den Lexikon-Einstellungen aktiviert werden.
  #   EOS
  #   "de"
  # end

  # language "en", default: true do
  #   caveats <<~EOS
  #     Installing OpenThesaurus Deutsch for all users.
  #     If it should be installed only for the current user, run:
  #       mv /Library/Dictionaries/OpenThesaurus\ Deutsch.dictionary ~/Library/Dictionaries/

  #     You may need to activate OpenThesaurus Deutsch in Dictionary’s preferences.
  #   EOS
  #   "en"
  # end

  name "OpenThesaurus Deutsch"
  desc "German thesaurus: OpenThesaurus.de for Dictionary.app"
  url "https://github.com/Tekl/openthesaurus-deutsch/releases/download/v#{version}/OpenThesaurus_Deutsch_dictionaryfile.zip",
      verified: "github.com/Tekl/openthesaurus-deutsch/"
  homepage "https://tekl.de/"

  livecheck do
    url "https://github.com/Tekl/openthesaurus-deutsch/releases/latest"
    strategy :page_match do |page|
      page.scan(%r{href=.*?tags/v?(\d+(?:\.\d+)+)}i)
          .map { |matches| (matches[0]).to_s }
    end
  end

  ### Moved for consistency: By default Installer.pkg installs it for all users.
  dictionary "OpenThesaurus Deutsch.dictionary", target: "/Library/Dictionaries/OpenThesaurus Deutsch.dictionary"

  caveats <<~EOS
    Installing OpenThesaurus Deutsch for all users.
    If it should be installed only for the current user, run:
      mv /Library/Dictionaries/OpenThesaurus\ Deutsch.dictionary ~/Library/Dictionaries/

    You may need to activate OpenThesaurus Deutsch in Dictionary’s preferences.
  EOS
end
