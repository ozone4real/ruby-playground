// # def solution(s, k)
// #   days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
// #   index = days.index(s)
// #   ans_index = (index + k) % 7
// #   days[ans_index]
// # end

// # puts solution("Sat", 500)

// User has list of brand he likes most

// User -> Brands
// If there are N liked beands by anybody

// Take the first N brand names from the list

// There are list of brands most popular for male and female

// If Userlist not enough take from his gender's top brand

// If Userslist + gender's top list not enough, throw an error


// function solution(U, N) {
//   Promise.all(
//     [
//       getLikedBrands(U.id),
//       getTopBrandsForGender(U.gender)
//     ]
//   ).then(([topForUser, topForGender]) => {
//     topForUser = topForUser.map((brand) => brand.name)
//     topForGender = topForGender.map((brand) => brand.name)
//     merged = new Set(topForUser.concat(topForGender))
//     if (merged.length < N) {
//       reject(new CustomError("Not enough data"))
//     }
//     resolve(Array.from(merged).slice(0, N))
//   });
// }

