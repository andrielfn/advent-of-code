package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"strconv"
	"strings"
)

func main() {
	file, err := os.Open("input")
	if err != nil {
		log.Fatal(err)
	}
	defer file.Close()

	var pl presentList

	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		l, w, h := parseDimensions(scanner.Text())

		pl.add(newPresent(l, w, h))
	}

	fmt.Println(pl.requiredWrappingPaper())
}

func parseDimensions(dimensions string) (int, int, int) {
	values := strings.Split(dimensions, "x")

	w, _ := strconv.Atoi(values[0])
	l, _ := strconv.Atoi(values[1])
	h, _ := strconv.Atoi(values[2])

	return w, l, h
}
