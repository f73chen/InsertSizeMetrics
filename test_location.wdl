workflow test_location {
    call find_tools
}

task find_tools {
    command {
        ls $JAVA_ROOT
        echo "@@@@@@@@@@@@@@@@"
        ls $PICARD_ROOT
        echo "@@@@@@@@@@@@@@@@"
        ls $RSTATS_ROOT
        echo "@@@@@@@@@@@@@@@@"
        
        echo $PATH
        echo "@@@@@@@@@@@@@@@@"
        echo $MANPATH
        echo "@@@@@@@@@@@@@@@@"
        echo $LD_LIBRARY_PATH
        echo "@@@@@@@@@@@@@@@@"
        echo $R_LIBS_SITE
        echo "@@@@@@@@@@@@@@@@"
    }
    output{
        String message = read_string(stdout())
    }
    runtime {
        docker: ""
        modules: "picard/2.21.2 rstats/3.6"
    }
}
