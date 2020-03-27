package main

import (
	"fmt"

	"github.com/t1mt/version-sample/version"
)

func main()  {
	ver := version.New()
	fmt.Printf("Server Version: %#v \n", ver)
}
