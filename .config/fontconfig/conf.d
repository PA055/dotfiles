<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
<fontconfig>
    <match target="font">
        <edit name="rgba" mode="assign">
        <const>rgb</const>
    </edit>
	</match>

  
<!-- Emoji -->
	
	<match>
		<test name="lang">
			<string>und-zsye</string>
		</test>
		<test qual="all" name="color" compare="not_eq">
			<bool>true</bool>
		</test>
		<test qual="all" name="color" compare="not_eq">
			<bool>false</bool>
		</test>
		<edit name="color" mode="append">
			<bool>true</bool>
		</edit>
	</match>

  <alias binding="same">
    <family>monospace</family>
    <prefer>
      <family>FiraCode Nerd Font Mono</family>
      <family>SpaceMono Nerd Font</family>
      <family>JetBrainsMono Nerd Font</family>
      <family>Noto Sans Mono</family>
      <family>Liberation Mono</family>
      <family>Latin Modern Mono</family>
    </prefer>
  </alias>

  <alias binding="same">
    <family>serif</family>
    <prefer>
      <family>Noto Serif</family>
      <family>Liberation Serif</family>
    </prefer>
  </alias>

	<alias binding="same">
		<family>emoji</family>
		<prefer>
			<!-- System fonts -->
			<family>Noto Color Emoji</family> <!-- Google -->
			<family>Apple Color Emoji</family> <!-- Apple -->
			<family>Segoe UI Emoji</family> <!-- Microsoft -->
			<family>Twitter Color Emoji</family> <!-- Twitter -->
			<family>EmojiOne Mozilla</family> <!-- Mozilla -->
			<!-- Third-Party fonts -->
			<family>Emoji Two</family>
			<family>Emoji One</family>
			<!-- Non-color -->
			<family>Noto Emoji</family> <!-- Google -->
			<family>Android Emoji</family> <!-- Google -->
		</prefer>
	</alias>

<!-- Math -->
	<alias binding="same">
		<!-- https://en.wikipedia.org/wiki/Category:Mathematical_OpenType_typefaces -->
		<family>math</family>
		<prefer>
			<family>XITS Math</family> <!-- Khaled Hosny -->
			<family>STIX Two Math</family> <!-- AMS -->
			<family>Cambria Math</family> <!-- Microsoft -->
			<family>Latin Modern Math</family> <!-- TeX -->
			<family>Minion Math</family> <!-- Adobe -->
			<family>Lucida Math</family> <!-- Adobe -->
			<family>Asana Math</family>
		</prefer>
	</alias>

  <alias binding="same">
		<family>Noto Color Emoji</family> <!-- Google -->
		<default><family>emoji</family></default>
	</alias>
	<alias binding="same">
		<family>Apple Color Emoji</family> <!-- Apple -->
		<default><family>emoji</family></default>
	</alias>
	<alias binding="same">
		<family>Segoe UI Emoji</family> <!-- Microsoft -->
		<default><family>emoji</family></default>
	</alias>
	<alias binding="same">
		<family>Twitter Color Emoji</family> <!-- Twitter -->
		<default><family>emoji</family></default>
	</alias>
	<alias binding="same">
		<family>EmojiOne Mozilla</family> <!-- Mozilla -->
		<default><family>emoji</family></default>
	</alias>
	<!-- Third-party emoji -->
	<alias binding="same">
		<family>Emoji Two</family>
		<default><family>emoji</family></default>
	</alias>
	<alias binding="same">
		<family>JoyPixels</family>
		<default><family>emoji</family></default>
	</alias>
	<alias binding="same">
		<family>Emoji One</family>
		<default><family>emoji</family></default>
	</alias>
	<!-- B&W -->
	<alias binding="same">
		<family>Noto Emoji</family> <!-- Google -->
		<default><family>emoji</family></default>
	</alias>
	<alias binding="same">
		<family>Android Emoji</family> <!-- Google -->
		<default><family>emoji</family></default>
	</alias>

	<!-- Add language for emoji, to match other emoji fonts. -->
	<match>
		<test name="family">
			<string>emoji</string>
		</test>
		<edit name="lang" mode="prepend">
			<string>und-zsye</string>
		</edit>
	</match>

	<match>
		<test name="lang">
			<string>und-zsye</string>
		</test>
		<test qual="all" name="family" compare="not_eq">
			<string>emoji</string>
		</test>

		<!-- Add generic family. -->
		<edit name="family" mode="append" binding="strong">
			<string>emoji</string>
		</edit>
	</match>


<!-- Math -->

	<!-- https://en.wikipedia.org/wiki/Category:Mathematical_OpenType_typefaces -->
	<alias binding="same">
		<family>XITS Math</family> <!-- Khaled Hosny -->
		<default><family>math</family></default>
	</alias>
	<alias binding="same">
		<family>STIX Two Math</family> <!-- AMS -->
		<default><family>math</family></default>
	</alias>
	<alias binding="same">
		<family>Cambria Math</family> <!-- Microsoft -->
		<default><family>math</family></default>
	</alias>
	<alias binding="same">
		<family>Latin Modern Math</family> <!-- TeX -->
		<default><family>math</family></default>
	</alias>
	<alias binding="same">
		<family>Minion Math</family> <!-- Adobe -->
		<default><family>math</family></default>
	</alias>
	<alias binding="same">
		<family>Lucida Math</family> <!-- Adobe -->
		<default><family>math</family></default>
	</alias>
	<alias binding="same">
		<family>Asana Math</family>
		<default><family>math</family></default>
	</alias>

	<!-- Add language for math, to match other math fonts. -->
	<match>
		<test name="family">
			<string>math</string>
		</test>
		<edit name="lang" mode="prepend">
			<string>und-zmth</string>
		</edit>
	</match>

	<match>
		<test name="lang">
			<string>und-zmth</string>
		</test>
		<test qual="all" name="family" compare="not_eq">
			<string>math</string>
		</test>

		<!-- Add generic family -->
		<edit name="family" mode="append" binding="strong">
			<string>math</string>
		</edit>
  </match>
</fontconfig>
