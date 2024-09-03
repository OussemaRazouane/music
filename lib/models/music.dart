class Music {
  String image;
  String music;
  String title;
  String artist;
  Music(
      {required this.image,
      required this.music,
      required this.title,
      required this.artist});
}

List<Music> musics = [
  Music(
    image:"assets/cover/1.jpg", 
    music:"sounds/1.mp3", 
    title:"Nightfall / Future Bass Music", 
    artist:"SoulProdMusic"
  ),
  Music(
    image:"assets/cover/2.jpg", 
    music:"sounds/2.mp3", 
    title:"Night Detective", 
    artist:"Amaksi"
  ),
  Music(
    image:"assets/cover/3.jpg", 
    music:"sounds/3.mp3", 
    title:"In Slow Motion (Inspiring Ambient Lounge)", 
    artist: "soundbay"
  ),
  Music(
    image: "assets/cover/4.jpg", 
    music:"sounds/4.mp3", 
    title:"AMALGAM", 
    artist: "Rockot"
  ),
  Music(
    image: "assets/cover/5.jpg", 
    music:"sounds/5.mp3", 
    title:"No Place To Go", 
    artist: "SergePavkinMusic"
  ),
  Music(
    image: "assets/cover/6.png", 
    music:"sounds/6.mp3", 
    title:"Flow", 
    artist: "Loksii"
  ),
  Music(
    image: "assets/cover/7.jpg", 
    music:"sounds/7.mp3", 
    title:"For Her Chill Upbeat Summel Travel Vlog ", 
    artist: "Lidérc"
  ),
  Music(
    image: "assets/cover/8.jpg", 
    music:"sounds/8.mp3", 
    title:"Solitude (Dark Ambient Electronic)", 
    artist: "lucafrancini"
  ),
];
