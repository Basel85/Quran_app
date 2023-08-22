class AyahModel {
  final int ayahNumber;
  final String ayahAudioUrl;
  final String ayahAudioSecondaryUrl;
  final String ayahText;
  AyahModel(this.ayahNumber, this.ayahAudioUrl, this.ayahAudioSecondaryUrl, this.ayahText);
  factory AyahModel.fromJson(Map<String,dynamic> ayahJson){
    return AyahModel(
      ayahJson['number'],
      ayahJson['audio'],
      ayahJson['audioSecondary'],
      ayahJson['text']
    );
  }
}
