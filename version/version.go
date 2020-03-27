package version

import (
	"fmt"
	"runtime"
)

var (
	// GitVersion 项目版本信息
	GitVersion = ""
	// GitCommit git提交commit id
	GitCommit = ""
	// BuildDate 构建时间
	BuildDate = ""
)

type Info struct {
	GitVersion string `json:"GitVersion"`
	GitCommit  string `json:"GitCommit"`
	BuildDate  string `json:"BuildDate"`
	GoVersion  string `json:"GoVersion"`
	Compiler   string `json:"Compiler"`
	Platform   string `json:"Platform"`
}

func New() Info {
	return Info{
		GitVersion: GitVersion,
		GitCommit:  GitCommit,
		BuildDate:  BuildDate,
		GoVersion:  runtime.Version(),
		Compiler:   runtime.Compiler,
		Platform:   fmt.Sprintf("%s/%s", runtime.GOOS, runtime.GOARCH),
	}
}
