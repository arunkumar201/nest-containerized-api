<p align="center">
  <a href="http://nestjs.com/" target="blank"><img src="https://nestjs.com/img/logo-small.svg" width="120" alt="Nest Logo" /></a>
</p>

[circleci-image]: https://img.shields.io/circleci/build/github/nestjs/nest/master?token=abc123def456
[circleci-url]: https://circleci.com/gh/nestjs/nest

  <p align="center">A progressive <a href="http://nodejs.org" target="_blank">Node.js</a> framework for building efficient and scalable server-side applications.</p>
    <p align="center">
<a href="https://www.npmjs.com/~nestjscore" target="_blank"><img src="https://img.shields.io/npm/v/@nestjs/core.svg" alt="NPM Version" /></a>
<a href="https://www.npmjs.com/~nestjscore" target="_blank"><img src="https://img.shields.io/npm/l/@nestjs/core.svg" alt="Package License" /></a>
<a href="https://www.npmjs.com/~nestjscore" target="_blank"><img src="https://img.shields.io/npm/dm/@nestjs/common.svg" alt="NPM Downloads" /></a>
<a href="https://circleci.com/gh/nestjs/nest" target="_blank"><img src="https://img.shields.io/circleci/build/github/nestjs/nest/master" alt="CircleCI" /></a>
<a href="https://discord.gg/G7Qnnhy" target="_blank"><img src="https://img.shields.io/badge/discord-online-brightgreen.svg" alt="Discord"/></a>
<a href="https://opencollective.com/nest#backer" target="_blank"><img src="https://opencollective.com/nest/backers/badge.svg" alt="Backers on Open Collective" /></a>
<a href="https://opencollective.com/nest#sponsor" target="_blank"><img src="https://opencollective.com/nest/sponsors/badge.svg" alt="Sponsors on Open Collective" /></a>
  <a href="https://paypal.me/kamilmysliwiec" target="_blank"><img src="https://img.shields.io/badge/Donate-PayPal-ff3f59.svg" alt="Donate us"/></a>
    <a href="https://opencollective.com/nest#sponsor"  target="_blank"><img src="https://img.shields.io/badge/Support%20us-Open%20Collective-41B883.svg" alt="Support us"></a>
  <a href="https://twitter.com/nestframework" target="_blank"><img src="https://img.shields.io/twitter/follow/nestframework.svg?style=social&label=Follow" alt="Follow us on Twitter"></a>
</p>
  <!--[![Backers on Open Collective](https://opencollective.com/nest/backers/badge.svg)](https://opencollective.com/nest#backer)
  [![Sponsors on Open Collective](https://opencollective.com/nest/sponsors/badge.svg)](https://opencollective.com/nest#sponsor)-->

## Description

[Nest](https://github.com/nestjs/nest) framework TypeScript starter repository.

## Project setup

```bash
$ pnpm install
```

## Compile and run the project

```bash
# development
$ pnpm run start

# watch mode
$ pnpm run start:dev

# production mode
$ pnpm run start:prod
```

## Run tests

```bash
# unit tests
$ pnpm run test

# e2e tests
$ pnpm run test:e2e

# test coverage
$ pnpm run test:cov
```

## Deployment

## Docker Commands

### Build and Run

```bash
# Build the Docker image
docker build -t nestjs-app .

# Run the container in detached mode
docker run -d --name my-nest-app -p 3000:3000 nestjs-app

# Run in interactive mode (for debugging)
docker run -it --rm -p 3000:3000 --name nestjs-debug nestjs-app
```

### Development Workflow

```bash
# Rebuild the image after changes
docker build -t nestjs-app .

# Stop and remove existing container
docker stop my-nest-app && docker rm my-nest-app

# Start the updated container
docker run -d --name my-nest-app -p 3000:3000 nestjs-app
```

### Container Management

```bash
# View running containers
docker ps

# View logs
docker logs -f my-nest-app

# Stop container
docker stop my-nest-app

# Remove container
docker rm my-nest-app

# Remove image
docker rmi nestjs-app
```

## Docker Deployment

### Optimized Docker Setup

The project includes a multi-stage Dockerfile that produces a minimal production image. The current optimized build size is approximately 193MB.

### Building the Docker Image

```bash
# Build the image
docker build -t your-app .

# For additional size optimization (requires experimental features):
docker build --squash -t your-app .

# Or use buildkit with compression:
DOCKER_BUILDKIT=1 docker build --compress -t your-app .
```

### Image Analysis

```bash
# View image history and layer sizes
docker history your-image-name

# Use dive for detailed layer analysis
docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock wagoodman/dive:latest your-image-name
```

### Expected Size Reductions

- **Distroless**: ~80-120MB (recommended for production)
- **Optimized Alpine**: ~180-200MB
- **Current**: ~193MB

### Additional Optimization Tips

1. **Dependency Management**:
   ```bash
   # Remove dev dependencies
   pnpm prune --prod
   ```

2. **Bundling**: Consider using `webpack` or `esbuild` for smaller distributions

3. **Base Images**:
   - `node:18-alpine` for a balance of size and functionality
   - `gcr.io/distroless/nodejs18` for minimal production images

4. **Multi-stage Builds**: The current Dockerfile uses multi-stage builds to keep the final image minimal

For production deployments, the distroless approach provides the smallest and most secure image, while Alpine offers more debugging tools if needed.

## Resources

Check out a few resources that may come in handy when working with NestJS:

- Visit the [NestJS Documentation](https://docs.nestjs.com) to learn more about the framework.
- For questions and support, please visit our [Discord channel](https://discord.gg/G7Qnnhy).
- To dive deeper and get more hands-on experience, check out our official video [courses](https://courses.nestjs.com/).