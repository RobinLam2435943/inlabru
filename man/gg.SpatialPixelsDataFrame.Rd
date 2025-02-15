% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ggplot.R
\name{gg.SpatialPixelsDataFrame}
\alias{gg.SpatialPixelsDataFrame}
\title{Geom for SpatialPixelsDataFrame objects}
\usage{
\method{gg}{SpatialPixelsDataFrame}(data, mapping = NULL, crs = NULL, mask = NULL, ...)
}
\arguments{
\item{data}{A SpatialPixelsDataFrame object.}

\item{mapping}{Aesthetic mappings created by \code{aes} used to update the default
mapping. The default mapping is \code{ggplot2::aes(x = .data[[coordnames(data)[1]]], y = .data[[coordnames(data)[2]]], fill = .data[[names(data)[[1]]]])}.}

\item{crs}{A \link{CRS} object defining the coordinate system to project the data to before plotting.}

\item{mask}{A SpatialPolygon defining the region that is plotted.}

\item{...}{Arguments passed on to \code{geom_tile}.}
}
\value{
A \code{geom_tile} return value.
}
\description{
Coerces input SpatialPixelsDataFrame to data.frame and uses \code{geom_tile} to plot it.
Requires the \code{ggplot2} package.
}
\examples{
\donttest{
  if (require(ggplot2, quietly = TRUE) &&
      bru_safe_sp() &&
      require("sp")) {
    # Load Gorilla data

    data("gorillas", package = "inlabru")

    # Plot Gorilla elevation covariate provided as SpatialPixelsDataFrame.
    # The same syntax applies to SpatialGridDataFrame objects.

    ggplot() +
      gg(gorillas$gcov$elevation)

    # Add Gorilla survey boundary and nest sightings

    ggplot() +
      gg(gorillas$gcov$elevation) +
      gg(gorillas$boundary) +
      gg(gorillas$nests)

    # Load pantropical dolphin data

    data("mexdolphin", package = "inlabru")

    # Plot the pantropical survey boundary, ship transects and dolphin sightings

    ggplot() +
      gg(mexdolphin$ppoly) + # survey boundary as SpatialPolygon
      gg(mexdolphin$samplers) + # ship transects as SpatialLines
      gg(mexdolphin$points) # dolphin sightings as SpatialPoints

    # Change color

    ggplot() +
      gg(mexdolphin$ppoly, color = "green") + # survey boundary as SpatialPolygon
      gg(mexdolphin$samplers, color = "red") + # ship transects as SpatialLines
      gg(mexdolphin$points, color = "blue") # dolphin sightings as SpatialPoints


    # Visualize data annotations: line width by segment number

    names(mexdolphin$samplers) # 'seg' holds the segment number
    ggplot() +
      gg(mexdolphin$samplers, aes(color = seg))

    # Visualize data annotations: point size by dolphin group size

    names(mexdolphin$points) # 'size' holds the group size
    ggplot() +
      gg(mexdolphin$points, aes(size = size))
  }
}
}
\seealso{
Other geomes for spatial data: 
\code{\link{gg}()},
\code{\link{gg.SpatRaster}()},
\code{\link{gg.SpatialGridDataFrame}()},
\code{\link{gg.SpatialLines}()},
\code{\link{gg.SpatialPixels}()},
\code{\link{gg.SpatialPoints}()},
\code{\link{gg.SpatialPolygons}()},
\code{\link{gg.sf}()},
\code{\link{gm}()}
}
\concept{geomes for spatial data}
