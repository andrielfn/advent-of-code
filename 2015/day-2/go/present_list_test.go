package main

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestTotalRequiredWrappingPaper(t *testing.T) {
	p1 := newPresent(2, 3, 4)  // 2*2*3 + 2*3*4 + 2*2*4 = 52 + 2*3 (extra)
	p2 := newPresent(1, 1, 10) // 2*5*6 + 2*5*7 + 2*6*7 = 214 + 5*6 (extra)

	var pl presentList

	pl.add(p1)
	pl.add(p2)

	assert.Equal(t, 94, pl.requiredWrappingPaper(), "should be equal")
}
