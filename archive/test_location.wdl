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
        docker: "g3chen/insertsizemetrics@sha256:679690868d0eb02a83ccbe3655a109daefb8f69983b8e17a1b4190310e852e83"
        modules: "picard/2.21.2 rstats/3.6"
    }
}
