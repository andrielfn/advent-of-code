package main

type presentList struct {
	presents []present
}

func (pl *presentList) add(present *present) {
	pl.presents = append(pl.presents, *present)
}

func (pl *presentList) requiredWrappingPaper() int {
	sum := 0

	for _, p := range pl.presents {
		// bkp := sum
		// fmt.Println(p.length, p.width, p.height, "=", p.requiredWrappingPaper())
		sum += p.requiredWrappingPaper()
		sum += p.requiredSlack()
		// fmt.Printf("%v + %v = %v\n", bkp, t, sum)

	}

	return sum
}
