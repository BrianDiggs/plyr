\name{progress_tk}
\alias{progress_tk}
\title{Graphical progress bar, powered by Tk.}
\usage{
  progress_tk(title = "plyr progress", label =
  "Working...", ...)
}
\arguments{
  \item{title}{window title}

  \item{label}{progress bar label (inside window)}

  \item{...}{other arguments passed on to
  \code{\link[tcltk]{tkProgressBar}}}
}
\description{
  A graphical progress bar displayed in a Tk window
}
\details{
  This graphical progress will appear in a separate window.
}
\examples{
l_ply(1:100, identity, .progress = "tk")
l_ply(1:100, identity, .progress = progress_tk(width=400))
l_ply(1:100, identity, .progress = progress_tk(label=""))
}
\seealso{
  \code{\link[tcltk]{tkProgressBar}} for the function that
  powers this progress bar

  Other progress bars: \code{\link{progress_none}},
  \code{\link{progress_text}}, \code{\link{progress_win}}
}

