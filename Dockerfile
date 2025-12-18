FROM texlive/texlive:latest

# Install required LaTeX packages
# Note: array, fontenc, helvet, ifthen are part of base LaTeX distribution
# tikz is part of pgf which is typically included
# Many packages may already be present in the base image
RUN tlmgr update --self || true && \
    tlmgr install --no-depends-at-all \
    latexmk \
    acmart \
    import \
    mdframed \
    xcolor \
    parskip \
    hyperref || true

WORKDIR /workspace

# Copy all necessary files
COPY resume.tex resume.cls ./
COPY sections/ ./sections/

CMD ["latexmk", "-pdf", "-interaction=nonstopmode", "-output-directory=pdf", "resume.tex"]

