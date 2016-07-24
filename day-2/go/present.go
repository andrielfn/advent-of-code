package main

type present struct {
	length int
	width  int
	height int
}

func newPresent(l, w, h int) *present {
	return &present{length: l, width: w, height: h}
}

func (p *present) requiredWrappingPaper() int {
	return 2*p.length*p.width + 2*p.width*p.height + 2*p.height*p.length
}

func (p *present) requiredSlack() int {
	lw := p.length * p.width
	lh := p.length * p.height
	wh := p.width * p.height

	if lw < lh && lw < wh {
		return lw
	} else if lh < lw && lh < wh {
		return lh
	} else {
		return wh
	}
}
