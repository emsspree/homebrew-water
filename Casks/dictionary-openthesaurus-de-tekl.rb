cask 'dictionary-openthesaurus-de-tekl' do
 #version :latest
  version '2021.12.09'
  sha256 :no_check

 #url 'https://github.com/Tekl/openthesaurus-deutsch/releases/latest/download/OpenThesaurus_Deutsch_dictionaryfile.zip'
  url "https://github.com/Tekl/openthesaurus-deutsch/releases/download/v#{version}/OpenThesaurus_Deutsch_dictionaryfile.zip"
  name 'OpenThesaurus Deutsch'
  desc 'OpenThesaurus in Deutsch (www.openthesaurus.de) von Tekl für die Lexikon-Anwendung. Extends macOS’ Dictionary application with a German thesaurus based on data from www.openthesaurus.de'
  homepage 'https://github.com/Tekl/openthesaurus-deutsch'

  livecheck do
    url 'https://github.com/Tekl/openthesaurus-deutsch/releases/latest'
    strategy :page_match do |page|
      page.scan(%r{href=.*?tags/v?(\d+(?:\.\d+)+)}i)
          .map { |matches| "#{matches[0]}" }
    end
  end

  dictionary 'OpenThesaurus Deutsch.dictionary' #, target: '/Library/Dictionaries/OpenThesaurus Deutsch.dictionary'

  caveats <<~EOS
    Eventuell muss diese Erweiterung (Referenzquelle) in den Lexikon-Einstellungen aktiviert werden.
    You may need to activate this plugin (reference source) in Dictionary’s preferences.
  EOS
    # Da keine Versionsprüfung stattfindet, wird dieser Cask nicht als »outdated« angezeigt, auch wenn’s so ist. Verwende die Funktion »Auf Update prüfen« in den Lexikon-Einstellungen oder `brew reinstall #{token}` zum Installieren der neuesten Version.
    # Since there is no version check, this Cask will not be shown as “outdated”, even if it is. Use the “Auf Update prüfen” button (“check for update”) or `brew reinstall #{token}` to install the latest version.

end
