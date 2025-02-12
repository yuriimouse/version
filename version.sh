#!/bin/bash
self=$_
version=${self%.*}

if [ -e "$version" ]; then
    current=$( cat $version | grep -m 1 '[^[:blank:]]' )
    echo $current
else 
    V_MAJOR=$($version.major)
    V_MINOR=$($version.minor)
    V_COMMIT=`git log --pretty=format:'%h' -n 1`
    V_BUILD=$($version.build)
    VERSION=$V_MAJOR.$V_MINOR.$V_BUILD

    echo "$VERSION"
    echo "#define VERSION_MAJOR $V_MAJOR" >$version.h
    echo "#define VERSION_MINOR $V_MINOR" >>$version.h
    echo "#define VERSION_BUILD $V_BUILD" >>$version.h
    echo "#define VERSION_COMMIT \"$V_COMMIT\"" >>$version.h
    echo "#define VERSION \"$VERSION\"" >>$version.h
    
    record="$VERSION\n$V_COMMIT"
    echo -e "$record" >$version
fi 

