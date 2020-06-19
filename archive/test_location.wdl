workflow test_location {
    call find_tools
}

task find_tools {
    command {
        ls $PICARD_ROOT
        echo "@@@@@@@@@@@@@@@@"
        ls $JAVA_ROOT
        echo "@@@@@@@@@@@@@@@@"
        ls $RSTATS_ROOT
        echo "@@@@@@@@@@@@@@@@"

        echo $PATH
        echo "################"
        echo $MANPATH
        echo "################"
        echo $LD_LIBRARY_PATH
        echo "################"
        echo $R_LIBS_SITE
        echo "################"
    }
    output{
        String message = read_string(stdout())
    }
    runtime {
        docker: "g3chen/insertsizemetrics:1.0"
    }
}
