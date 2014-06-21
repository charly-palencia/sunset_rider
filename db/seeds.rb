#   Add Bossess
[
  {name: "Simon Greedwell", image_url: "http://www.arcadequartermaster.com/ssr/bounty1.png", points: 10000},
  {name: "Hawkeye Hank Hatfield", image_url: "http://www.arcadequartermaster.com/ssr/bounty2.png", points: 20000},
  {name: "Dark Horse", image_url: "http://www.arcadequartermaster.com/ssr/bounty3.png", points: 30000},
  {name: "The Smith Brothers", image_url: "http://www.arcadequartermaster.com/ssr/bounty4.png", points: 40000},
  {name: "El Greco", image_url: "http://www.arcadequartermaster.com/ssr/bounty5.png", points: 50000},
  {name: "Chief Scalpem", image_url: "http://www.arcadequartermaster.com/ssr/bounty6.png", points: 60000},
  {name: "Paco Loco", image_url: "http://www.arcadequartermaster.com/ssr/bounty7.png", points: 70000},
  {name: "Sir Richard Rose", image_url: "http://www.arcadequartermaster.com/ssr/bounty8.png", points: 100000}
].each { |data| Boss.create(data) }
