package main

import (
	"github.com/stretchr/testify/assert"

	"testing"
)

func TestRequiredWrappingPaper(t *testing.T) {
	p1 := newPresent(2, 3, 4)
	assert.Equal(t, 52, p1.requiredWrappingPaper(), "should be equal")

	p2 := newPresent(1, 1, 10)
	assert.Equal(t, 42, p2.requiredWrappingPaper(), "should be equal")
}

func TestExtraWrappingPaper(t *testing.T) {
	p1 := newPresent(2, 3, 4)
	assert.Equal(t, 6, p1.requiredSlack(), "should be equal")

	p2 := newPresent(1, 1, 10)
	assert.Equal(t, 1, p2.requiredSlack(), "should be equal")
}
