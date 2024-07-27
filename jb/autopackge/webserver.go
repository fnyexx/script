package main

import (
	"fmt"
	"net/http"
	"os/exec"
)

func indexHandler1(w http.ResponseWriter, r *http.Request) {
	command := `nohup /opt/run1.sh 2>&1 &`
	cmd := exec.Command("/bin/sh", "-c", command)

	output, err := cmd.Output()
	if err != nil {
		fmt.Fprintf(w, "Execute Shell:%s failed with error:%s", command, err.Error())
		return
	}
	fmt.Fprintf(w, "Execute Shell:%s finished with output:\n%s", command, string(output))
}

func indexHandler2(w http.ResponseWriter, r *http.Request) {
	command := `nohup /opt/run2.sh 2>&1 &`
	cmd := exec.Command("/bin/sh", "-c", command)

	output, err := cmd.Output()
	if err != nil {
		fmt.Fprintf(w, "Execute Shell:%s failed with error:%s", command, err.Error())
		return
	}
	fmt.Fprintf(w, "Execute Shell:%s finished with output:\n%s", command, string(output))
}
func indexHandler3(w http.ResponseWriter, r *http.Request) {
	command := `nohup /opt/run3.sh 2>&1 &`
	cmd := exec.Command("/bin/sh", "-c", command)

	output, err := cmd.Output()
	if err != nil {
		fmt.Fprintf(w, "Execute Shell:%s failed with error:%s", command, err.Error())
		return
	}
	fmt.Fprintf(w, "Execute Shell:%s finished with output:\n%s", command, string(output))
}
func indexHandler4(w http.ResponseWriter, r *http.Request) {
	command := `nohup /opt/run4.sh 2>&1 &`
	cmd := exec.Command("/bin/sh", "-c", command)

	output, err := cmd.Output()
	if err != nil {
		fmt.Fprintf(w, "Execute Shell:%s failed with error:%s", command, err.Error())
		return
	}
	fmt.Fprintf(w, "Execute Shell:%s finished with output:\n%s", command, string(output))
}

func indexHandler5(w http.ResponseWriter, r *http.Request) {
	command := `nohup /opt/run5.sh 2>&1 &`
	cmd := exec.Command("/bin/sh", "-c", command)

	output, err := cmd.Output()
	if err != nil {
		fmt.Fprintf(w, "Execute Shell:%s failed with error:%s", command, err.Error())
		return
	}
	fmt.Fprintf(w, "Execute Shell:%s finished with output:\n%s", command, string(output))
}

func main() {
	http.HandleFunc("/1", indexHandler1)
	http.HandleFunc("/2", indexHandler2)
	http.HandleFunc("/3", indexHandler3)
	http.HandleFunc("/4", indexHandler4)
	http.HandleFunc("/5", indexHandler5)
	http.ListenAndServe(":8111", nil)
}
