# 빌드 환경 설정
FROM gradle:7.6.1-jdk17 AS builder
WORKDIR /app
COPY . .
RUN rm -rf ~/.gradle/caches/
RUN gradle bootJar --no-daemon

# 실행 환경 설정 (작은 이미지 사용)
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY --from=builder /app/build/libs/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
