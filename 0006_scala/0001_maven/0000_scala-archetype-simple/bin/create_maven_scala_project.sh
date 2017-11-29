#!/bin/bash

SETTINGS_PATH=${1}
ARTIFACT_ID=${2}
PACKAGE=${3}


mvn -s ${SETTINGS_PATH} archetype:generate -B \
    -DarchetypeGroupId=net.alchim31.maven -DarchetypeArtifactId=scala-archetype-simple -DarchetypeVersion=1.6 \
    -DgroupId=${PACKAGE} -DartifactId=${ARTIFACT_ID} -Dversion=0.1-SNAPSHOT -Dpackage=${PACKAGE}

pushd ${ARTIFACT_ID}

cat <<EOF > specs-junit.frg
    <dependency>
      <groupId>org.specs2</groupId>
      <artifactId>specs2-junit_\${scala.compat.version}</artifactId>
      <version>2.4.16</version>
      <scope>test</scope>
    </dependency>
EOF

cat <<EOF > pluginManagement.xml.frg
    <pluginManagement>
      <plugins>
        <plugin>
          <groupId>net.alchim31.maven</groupId>
          <artifactId>scala-maven-plugin</artifactId>
          <version>3.2.0</version>
        </plugin>
        <plugin>
          <groupId>org.apache.maven.plugins</groupId>
          <artifactId>maven-compiler-plugin</artifactId>
          <version>2.0.2</version>
        </plugin>
        <plugin>
          <groupId>org.apache.maven.plugins</groupId>
          <artifactId>maven-jar-plugin</artifactId>
          <version>3.0.2</version>
        </plugin>
      </plugins>
    </pluginManagement>
EOF

cat <<EOF > maven-assembly-plugin.xml.frg

      <!-- Plugin to create a single jar that includes all dependencies -->
      <plugin>
        <artifactId>maven-assembly-plugin</artifactId>
        <version>2.4</version>
        <configuration>
          <descriptorRefs>
            <descriptorRef>jar-with-dependencies</descriptorRef>
          </descriptorRefs>
          <archive>
            <manifest>
              <mainClass>${PACKAGE}.App</mainClass>
            </manifest>
          </archive>
        </configuration>
        <executions>
          <execution>
            <id>make-assembly</id>
            <phase>package</phase>
            <goals>
              <goal>single</goal>
            </goals>
          </execution>
        </executions>
      </plugin>

EOF

emacs --batch --eval "
(progn (find-file \"pom.xml\")
       (search-forward \"make:transitive\")
       (beginning-of-line)
       (kill-line)
       (kill-line)
       (beginning-of-buffer)
       (search-forward \"</dependencies>\")
       (beginning-of-line)
       (open-line 1)
       (insert-file \"specs-junit.frg\")
       (beginning-of-buffer)
       (search-forward \"<build>\")
       (next-line)
       (beginning-of-line)
       (open-line 1)
       (insert-file \"pluginManagement.xml.frg\")
       (search-forward \"</build>\")
       (search-backward \"</plugins>\")
       (beginning-of-line)
       (open-line 1)
       (insert-file \"maven-assembly-plugin.xml.frg\")
       (save-buffer))"

popd
