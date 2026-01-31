FROM texlive/texlive:latest

LABEL maintainer="GitHub Copilot Example"
LABEL description="Reproducible LaTeX build environment"

WORKDIR /workspace
COPY . .

# Build the whitepaper
RUN bash scripts/build.sh

CMD ["/bin/bash"]
